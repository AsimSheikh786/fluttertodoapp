import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: 'First ToDo',
        description: 'Hello World'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Welcome Note',
        description: 'Welcome to my first Flutter ToDo app'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Shaikh Muhammad Asim Qadri',
        description: 'asimsheikh786159@gmail.com'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Pakistan Zindabad',
        description: 'Jawan Pakistan'),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
