import 'package:flutter/material.dart';
import 'package:todo_app/dialog_box.dart';
import 'package:todo_app/todo_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TODO'),
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
  final _controller = TextEditingController();

  List tasks = [
    ["Test 1", false],
    ["Test 2", false]
  ];

  void checkBoxClicked(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      tasks.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void createTask() {
    showDialog(
      context: context, builder: (context) {
        return MyDialogBox(
          controller: _controller,
          onSave: () => saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: tasks[index][0], 
            taskCompleted: tasks[index][1], 
            onChanged: (value) => checkBoxClicked(value, index),
          );
        },
      ),
    );
  }
}
