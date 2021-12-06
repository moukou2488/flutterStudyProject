import 'package:flutter/material.dart';
import 'package:flutter_application_search_filter_list/Views/buttonView.dart';
import 'package:flutter_application_search_filter_list/Views/middleView.dart';
import 'package:flutter_application_search_filter_list/controller/buttonController.dart';
import 'package:flutter_application_search_filter_list/controller/searchController.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SearchController());
  Get.put(ButtonController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'filter list',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MiddleView()),
        GetPage(name: '/button', page: () => ButtonView())
      ],
    );
  }
}
