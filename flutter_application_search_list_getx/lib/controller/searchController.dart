import 'package:flutter/cupertino.dart';
import 'package:flutter_application_search_filter_list/data/filterList.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  final resultList = <String>[].obs;
  TextEditingController searchText = TextEditingController(text: "");
  TextStyle matchText =
          TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      defaultText = TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal); //검색 목록 텍스트 스타일 (검색어포함단어, 미포함단어)

  // 검색어 포함 목록 만들기
  void findResult(String text) {
    if (text.isEmpty) {
      resultList.clear();
      resultList.addAll(filterList);
    } else {
      resultList.clear();
      resultList.addAll(filterList
          .where((filter) => filter.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
  }

//검색어 리스트 텍스트 스타일 변경
  TextSpan searchMatch(String filterName) {
    var refinedFilterName = filterName.toLowerCase();
    var refinedSearch = searchText.text.toLowerCase();

    if (refinedSearch.length == 0)
      return TextSpan(text: filterName, style: defaultText); // 검색어 없을 시
    else if (refinedFilterName.indexOf(refinedSearch) >= 0) {
      var ReturnTextSpan = TextSpan(text: "", children: []);
      for (int i = 0; i < filterName.length; i++) {
        int index = refinedFilterName.indexOf(refinedSearch);
        if (i >= index && i < index + refinedSearch.length) {
          ReturnTextSpan.children
              ?.add(TextSpan(text: filterName[i], style: matchText));
        } else {
          ReturnTextSpan.children
              ?.add(TextSpan(text: filterName[i], style: defaultText));
        }
      }
      return ReturnTextSpan;
    } else {
      return TextSpan(text: filterName, style: defaultText); // 검색어 없을 시
    }
    // if (refinedFilterName.contains(refinedSearch)) {
    //   if (refinedFilterName.substring(0, refinedSearch.length) ==
    //       refinedSearch) {
    //     // 싱황 1. 단어 첫머리에 검색어 포함 시
    //     return TextSpan(
    //       style: matchText,
    //       text: filterName.substring(0, refinedSearch.length), //검색어 포함부분까지 자르고
    //       children: [
    //         searchMatch(
    //           // 포함 안하는 부분 textSpan 세팅위해 다시 searchMatch 보냄
    //           filterName.substring(
    //             refinedSearch.length,
    //           ),
    //         ),
    //       ],
    //     );
    //   } else if (refinedFilterName.length == refinedSearch.length) {
    //     // 상황 2. 단어와 검색어 전부 일치 시
    //     return TextSpan(text: filterName, style: matchText);
    //   } else {
    //     // 상황 3. 단어 가운데에 검색어 포함 시
    //     return TextSpan(
    //       style: defaultText,
    //       text: filterName.substring(
    //         0,
    //         refinedFilterName.indexOf(refinedSearch),
    //       ), // 검색어 포함하기 직전까지 잘라서 default style
    //       children: [
    //         searchMatch(
    //           // 검색어 포함 시작 부분부터 잘라서 다시 searchMatch 보내서 단어 첫머리에 검색어 포함 시 모드로 탐
    //           filterName.substring(
    //             refinedFilterName.indexOf(refinedSearch),
    //           ),
    //         ),
    //       ],
    //     );
    //   }
    // } else {
    //   // 잘려진 검색어 포함 안하는 부분 textSpan 세팅
    //   return TextSpan(text: filterName, style: defaultText);
  }
}
