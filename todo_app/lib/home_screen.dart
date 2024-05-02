import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 232, 228),
        centerTitle: true,
        title: const Text("TODO APP", style: TextStyle(
        fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 450,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        todos[index].check = todos[index].check;
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Todo(
                              title: todos[index].title.toString(),
                              desc: todos[index].desc.toString(),
                              done: todos[index].check,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              todos.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: title,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: desc,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    todos.add(
                      TodoModel(title.text, desc.text),
                    );
                    setState(() {});
                  },
                  child: const Text(
                    'Add Todo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
