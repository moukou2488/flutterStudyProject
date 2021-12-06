import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_search_filter_list/controller/searchController.dart';
import 'package:get/get.dart';

Widget SearchList() {
  SearchController searchController = Get.find();
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) => searchController.findResult(text),
            controller: searchController.searchText,
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemBuilder: (_, idx) {
                    return ListTile(
                      title: RichText(
                        text: searchController
                            .searchMatch(searchController.resultList[idx]),
                      ),
                    );
                  },
                  itemCount: searchController.resultList.length,
                )),
          ),
        ],
      ),
    ),
  );
}
