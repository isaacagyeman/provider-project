import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/Shared/TodoCard.dart';
import 'package:providerproject/database/todoDB.dart';
import 'package:providerproject/services/todo_Service.dart';
import '../models/todoModel.dart';

class TodoPage extends StatefulWidget {
  TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todosList = [];
  late TextEditingController todoInputcontroller;

  @override
  void initState() {
    super.initState();
    todoInputcontroller = TextEditingController();
    loadData();
  }

  @override
  void dispose() {
    TodoDatabase.instance.closeDB();
    super.dispose();
  }

  void loadData() async {
    todosList = await context.read<TodoService>().todos;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("TODO",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0)),
            IconButton(
                onPressed: () async {
                  print(todosList);
                  if (todoInputcontroller.text.isEmpty) {
                    SnackBar(
                        content: Text("Text field must not be empty"),
                        elevation: 60.0,
                        backgroundColor: Colors.amber);
                    print("input Field is empty");
                  } else {
                    Todo todo = Todo(
                        title: todoInputcontroller.text.trim(),
                        created: DateTime.now(),
                        status: false);
                    if (context.read<TodoService>().todos.contains(todo)) {
                      print(
                          "The todo you entered already exists in the database");
                      SnackBar(
                          content: Text(
                              "Duplicate values detected, enter different value!"));
                      print("There is a duplicate in the list of items");
                    } else {
                      String result =
                          await context.read<TodoService>().createTodo(todo);
                      if (result == "OK") {
                        print("Item added!!");
                        SnackBar(content: Text("Item successfully added "));
                        todoInputcontroller.text = "";
                      }
                    }
                  }
                  loadData();
                },
                icon: Icon(Icons.save))
          ]),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "What to do?",
            ),
            controller: todoInputcontroller,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: Consumer<TodoService>(
                builder: ((context, value, child) {
                  return ListView.builder(
                      itemCount: value.todos.length,
                      itemBuilder: (context, index) {
                        return TodoCard(
                          todo: value.todos[index],
                        );
                      });
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
