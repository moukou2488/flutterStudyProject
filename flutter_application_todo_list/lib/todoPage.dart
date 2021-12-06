import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/todoController.dart';
import 'package:get/get.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Flexible(
                  child: TextField(
                controller: controller.content,
              )),
              IconButton(
                  onPressed: () => controller.changeContent(),
                  icon: Icon(Icons.navigate_next))
            ]),
            Expanded(
                child: Obx(
              () => ListView.builder(
                itemBuilder: (_, idx) {
                  return ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.change_circle_outlined),
                          onPressed: () => controller.beforeModify(idx),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded),
                          onPressed: () {
                            controller.todoList.removeAt(idx);
                          },
                        )
                      ],
                    ),
                    onTap: () => controller.changeStatus(idx),
                    title: controller.todoList[idx].contentTextWidget(),
                  );
                },
                itemCount: controller.todoList.length,
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
