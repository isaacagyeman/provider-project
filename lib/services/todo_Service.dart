import 'package:flutter/material.dart';
import '../database/todoDB.dart';
import '../models/todoModel.dart';

class TodoService with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<String> getTodos(/*Todo todo*/ /*String title*/) async {
    try {
      _todos = await TodoDatabase.instance.getTodo(/*todo*/ /*title*/);
      notifyListeners();
    } catch (e) {
      return e.toString();
    }
    return 'OK';
  }

  Future<String> deleteTodo(Todo todo) async {
    try {
      await TodoDatabase.instance.delTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(/*todo.title*/);
    return result;
  }

  Future<String> createTodo(Todo todo) async {
    try {
      await TodoDatabase.instance.createTodo(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(/*todo.title*/);
    return result;
  }

  Future<String> toggleTodoStatus(Todo todo) async {
    try {
      await TodoDatabase.instance.toggleTodoDone(todo);
    } catch (e) {
      return e.toString();
    }
    String result = await getTodos(/*todo.title*/);
    return result;
  }
  
}
