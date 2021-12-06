import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lotto',
      home: LottoApp(),
    );
  }
}

class LottoApp extends StatelessWidget {
  //Set을 사용하는 방법
  // final lottoSet = lottoNumber();
  // final mySet = myNumber();

  //list generate를 사용하는 방법
  final lottoList = lottoNumber2Shuffle();
  final myList = myNumber2Shuffle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lotto'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text('이번주 로또 번호는..!'),
            SizedBox(
              height: 15,
            ),
            Text(lottoList.toString()),
            SizedBox(
              height: 35,
            ),
            Text('나의 추첨 번호'),
            SizedBox(
              height: 15,
            ),
            Text(myList.toString()),
            SizedBox(
              height: 35,
            ),
            Text('동일한 번호는? ' +
                checkNum(lottoList, myList)['count'].toString() +
                '개'),
            SizedBox(
              height: 15,
            ),
            checkNum(lottoList, myList)['sameList'].length != 0
                ? Text(checkNum(lottoList, myList)['sameList'].toString())
                : Text('일치하는 번호가 없습니다.'),
          ])),
    );
  }
}

// 랜덤 함수 사용하기
Set<int> lottoNumber() {
  final random = Random();
  final Set<int> lottoSet = {};

  while (lottoSet.length != 6) {
    lottoSet.add(random.nextInt(45) + 1);
  }
  return lottoSet;
}

Set<int> myNumber() {
  final random = Random();
  final Set<int> mySet = {};

  while (mySet.length != 6) {
    mySet.add(random.nextInt(45) + 1);
  }

  return mySet;
}

// List generate와 shuffle 사용하기
List<int> lottoNumber2Shuffle() {
  final List<int> lottoList =
      (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);

  return lottoList;
}

List<int> myNumber2Shuffle() {
  final List<int> myList =
      (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);

  return myList;
}

// 동일 번호 확인하기
Map<String, dynamic> checkNum(lottoList, myList) {
  List<int> sameList = [];
  int count = 0;
  for (int lotto in lottoList) {
    for (int myNum in myList) {
      if (lotto == myNum) {
        count++;
        sameList.add(myNum);
      }
    }
  }
  return {'count': count, 'sameList': sameList};
}
