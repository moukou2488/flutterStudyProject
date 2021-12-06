import 'package:flutter/material.dart';
import 'package:flutter_application_search_filter_list/component/searchList.dart';
import 'package:flutter_application_search_filter_list/controller/searchController.dart';
import 'package:get/get.dart';

class MiddleView extends StatelessWidget {
  SearchController searchController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              Text(
                'filter search',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900]),
              ),
              Expanded(child: SearchList()),
              InkWell(
                onTap: () => Get.toNamed('/button'),
                child: Icon(Icons.circle),
              )
            ])),
      ),
    );
  }
}
