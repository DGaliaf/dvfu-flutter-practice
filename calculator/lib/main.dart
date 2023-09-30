import 'package:flutter/material.dart';

// TODO: Calculator logic

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operation = '';
  dynamic prevOperation = '';
   
  void calculation(btnText) {
    if(operation == '=' && btnText == '=') {
      if(prevOperation == '+') {
         finalResult = add();
      } else if(prevOperation == '-') {
          finalResult = sub();
      } else if(prevOperation == '*') {
          finalResult = mul();
      } else if(prevOperation == '/') {
          finalResult = div();
      } 

    } else if (btnText == '+' || btnText == '-' || btnText == '*' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(operation == '+') {
          text = '+';
          finalResult = add();
      } else if( operation == '-') {
          text = '-';
          finalResult = sub();
      } else if( operation == '*') {
          text = '*';
          finalResult = mul();
      } else if( operation == '/') {
          text = '/';
          finalResult = div();
      }

      prevOperation = operation;
      operation = btnText;
      result = '';
    } else if (btnText == '.') {
      if(!result.toString().contains('.')) {
        result = '$result.';
      }

      finalResult = result;
    } else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
        text = finalResult;
    });
  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);           
    
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        
        if(!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
    }

    return result; 
  }

  Widget createButton(String text, Color buttonColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
            calculation(text);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          shape: const MaterialStatePropertyAll(LinearBorder())
        ),
        child: Text(text, style: TextStyle(
            fontSize: 35,
            color: textColor,
        ))
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(text, style: const TextStyle(fontSize: 100), textAlign: TextAlign.left),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton("7", Colors.purple, Colors.white),
                  createButton("8", Colors.purple, Colors.white),
                  createButton("9", Colors.purple, Colors.white),
                  createButton("*", Colors.black, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton("4", Colors.purple, Colors.white),
                  createButton("5", Colors.purple, Colors.white),
                  createButton("6", Colors.purple, Colors.white),
                  createButton("-", Colors.black, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton("1", Colors.purple, Colors.white),
                  createButton("2", Colors.purple, Colors.white),
                  createButton("3", Colors.purple, Colors.white),
                  createButton("+", Colors.black, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton(",", Colors.black, Colors.orange),
                  createButton("0", Colors.purple, Colors.white),
                  createButton("=", Colors.black, Colors.orange),
                  createButton("/", Colors.black, Colors.orange),
                ],
              ),
              const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
