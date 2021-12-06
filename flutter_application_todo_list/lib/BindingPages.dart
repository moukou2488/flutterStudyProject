import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/todoController.dart';
import 'package:get/get.dart';

class BindingPages implements Bindings{
  @override
  void dependencies() {
    Get.put(TodoController());
  }
  
}