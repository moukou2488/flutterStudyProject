import 'package:flutter/material.dart';
import 'package:flutter_application_search_filter_list/component/searchList.dart';
import 'package:flutter_application_search_filter_list/controller/buttonController.dart';
import 'package:get/get.dart';

class ButtonView extends StatelessWidget {
  ButtonController buttonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Obx(() => buttonController.showSearchList.value
              ? Expanded(child: SearchList())
              : IconButton(
                  onPressed: () => buttonController.showSearchList.value = true,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                ))),
    );
  }
}
