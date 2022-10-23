import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mytodoapp/viewmodel/todoProvider.dart';
import 'package:riverpod/riverpod.dart';
import 'todoAdd.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListProvider = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tsunaki Todo"),
      ),
      body: TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(todoProvider.notifier).deleteAllTodo();
          //画面遷移も状態管理に持っていきたい
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Todo リストの内容に変化があるとウィジェットが更新される
    final todos = ref.watch(todoProvider.notifier).state;

    // スクロール可能なリストビューで Todo リストの内容を表示
    return ListView(
      children: [
        // for (final todo in todos) Text(todo.title),
        for (final todo in todos)
          CheckboxListTile(
            value: !todo.isCompleted,
            // 各 Todo をタップすると、完了ステータスを変更できる
            onChanged: (value) =>
                ref.read(todoProvider.notifier).checkTodo(!todo.isCompleted),
            title: Text(todo.title),
          ),
      ],
    );
  }
}
