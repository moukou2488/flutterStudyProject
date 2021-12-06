import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/TodoDto.dart';
import 'package:get/get.dart';

class TodoTile extends StatelessWidget {
  final TodoDto todoItem;
  TodoTile(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.more_vert),
      onTap: () => Get.toNamed('/detail'),
      title: Text(todoItem.content),
    );
  }
}
