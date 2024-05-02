import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            tasks[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Task'),
        content: TextField(controller: controller),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                tasks.add(controller.text);
                controller.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
