import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/todoController.dart';
import 'package:get/get.dart';

class TodoDetail extends GetView<TodoController> {
  const TodoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int idx = int.parse(Get.parameters['idx']!);
    return Scaffold(
      body: Stack(children: [
        SafeArea(
          child: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () => Get.back(),
          ),
        ),
        Center(
          child: Text(controller.todoList[idx].content),
        ),
      ]),
    );
  }
}
