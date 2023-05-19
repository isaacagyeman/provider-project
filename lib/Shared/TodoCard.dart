import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/services/todo_Service.dart';

import '../models/todoModel.dart';

class TodoCard extends StatelessWidget {
  TodoCard({super.key, required this.todo});
  Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Slidable(
          endActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) async {
                String result =
                    await context.read<TodoService>().deleteTodo(todo);
                if (result == "OK") {
                  SnackBar(content: Text("Item Deleted Successfully"));
                } else {
                  SnackBar(content: Text(result));
                }
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            )
          ]),
          child: CheckboxListTile(
            checkColor: Colors.blue,
            activeColor: Colors.black,
            value: todo.status,
            onChanged: ((value) async {
              String result =
                  await context.read<TodoService>().toggleTodoStatus(todo);
              if (result != 'OK') {
                SnackBar(content: Text("$result cannot be selected"));
              }
            }),
            subtitle: Text(
              '${todo.created.day}/${todo.created.month}/${todo.created.year}',
              style: const TextStyle(color: Colors.black, fontSize: 13.0),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                  color: Colors.black,
                  decoration: todo.status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          )),
    );
  }
}
