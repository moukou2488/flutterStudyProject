import 'package:flutter/cupertino.dart';

class TodoDto {
  String content;
  DateTime date;
  String status;

  Widget contentTextWidget() {
    if (this.status == 'done')
      return Text(
        this.content,
        style: TextStyle(decoration: TextDecoration.lineThrough),
      );
    else
      return Text(this.content);
  }

  TodoDto(this.content, this.date, this.status);
}
