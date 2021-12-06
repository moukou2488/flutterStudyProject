import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/todoController.dart';
import 'package:flutter_application_todo_list/todoDetail.dart';
import 'package:flutter_application_todo_list/todoPage.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TODO List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red[100]),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => TodoPage(),
            binding: BindingsBuilder(() {
              Get.put(TodoController());
            })),
        GetPage(name: '/detail/:idx', page: () => TodoDetail()),
      ],
    );
  }
}
