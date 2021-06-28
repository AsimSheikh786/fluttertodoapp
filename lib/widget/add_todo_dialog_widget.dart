import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/todo_form_widget.dart';
import 'package:todoapp/model/todo.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formkey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add Todo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[300],
                  fontSize: 22,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: addTodo,
            ),
          ],
        ),
      ));
  void addTodo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
     
final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();

    }
  }
}
