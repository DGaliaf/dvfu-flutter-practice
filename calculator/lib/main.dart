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
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void calculation(String buttonText){

    if(buttonText == "CLEAR"){
      
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = buttonText;

    } else if(buttonText == "."){

      if(_output.contains(".")){
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();

        if (num1 - num2 < 0) {
          _output = "-$_output";
        }
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    setState(() {
      if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
        output = _output;
      } else {
        if (_output[0] == "+" || _output[0] == "-" || _output[0] == "/" || _output[0] == "*") {
          output = double.parse(_output.substring(1)).toString();
        } else {
          output = double.parse(_output).toString();
        }
      }
    });

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
                    Text(output, style: const TextStyle(fontSize: 100), textAlign: TextAlign.left),
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
                  createButton(".", Colors.black, Colors.orange),
                  createButton("0", Colors.purple, Colors.white),
                  createButton("=", Colors.black, Colors.orange),
                  createButton("/", Colors.black, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton("CLEAR", Colors.black, Colors.orange),
                ],
              ),
              const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
