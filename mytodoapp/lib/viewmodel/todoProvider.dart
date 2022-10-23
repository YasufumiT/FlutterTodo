import 'dart:ffi';

import 'package:mytodoapp/model/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mytodoapp/model/todo.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>(((ref) {
  return TodoNotifier();
}));

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  //StateNotiferのstateはイミュータブル(不変)のため、関数実行時はstateを1から新しく作成更新する必要がある。

  void addTodo(String todo) {
    int id = state.length + 1;
    state = [...state, TodoModel(id, todo, false)];
  }

  void deleteAllTodo() {
    state = [];
  }

  void removeTodo(int id) {
    //いずれ追加
    state = [
      for (final todo in state)
        if (id != todo.id) todo
    ];
  }

  void editTodo(int id, String todo) {
    //いずれ追加
    state = [
      for (final todo in state)
        if (id == todo.id) ...state,
      TodoModel(id, todo, false)
    ];
  }

  void checkTodo(bool checked) {
    print(checked);
  }
}
