import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/TodoDto.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final todoList = <TodoDto>[].obs;
  bool modify = false;
  int? modifyIdx;
  TextEditingController content = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Get.defaultDialog(
        title: 'Hi~!', middleText: 'Welcome to Beautiful MouKou TODO LIST!!');
  }

  void addTodoItem() {
    todoList.add(new TodoDto(this.content.text, new DateTime.now(), 'doing'));
  }

  void changeStatus(int idx) {
    todoList[idx].status == 'doing'
        ? todoList[idx].status = 'done'
        : todoList[idx].status = 'doing';
    todoList.refresh();
  }

  void beforeModify(int idx) {
    content.text = todoList[idx].content;
    modify = true;
    modifyIdx = idx;
  }

  void changeContent() {
    modify ? todoList[modifyIdx as int].content = content.text : addTodoItem();
    todoList.refresh();
    modify = false;
    modifyIdx = null;
    content.text = '';
  }
}
