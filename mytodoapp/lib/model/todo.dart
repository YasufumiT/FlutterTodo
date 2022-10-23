import 'dart:ffi';

import 'package:flutter/material.dart';

@immutable
class TodoModel {
  const TodoModel(this.id, this.title, this.isCompleted);
  final int id;
  final String title;
  final bool isCompleted;
}

//使用しない
class TodoList {
  const TodoList(this.date, this.todolist);
  final DateTime date;
  final List<TodoModel> todolist;
}

//使用しない
class WeeklyTodoList {
  const WeeklyTodoList(this.weeklytodolist, sample1);
  final List<TodoList> weeklytodolist;
  final List sample1 = sample.values;

  void test() {
    for (var value in sample.values) {
      print(value.index);
    }
  }
}

enum sample {
  test,
  test2,
  test3,
}
