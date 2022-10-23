import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../viewmodel/todoProvider.dart';

//Todo追加画面ビュー
// class TodoAddPage extends StatefulWidget {
//   _TodoAddPageState createState() => _TodoAddPageState();
// }

class TodoAddPage extends ConsumerWidget {
  String _text = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo追加"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                _text = value;
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).addTodo(_text);
                  Navigator.of(context).pop();
                },
                child: Text("リスト追加", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("キャンセル"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
