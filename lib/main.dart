import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_api/ui/root/root_screen.dart';

// 分析する
//  flutter pub run dart_code_metrics:metrics analyze lib
// 未使用のファイルを確認する
// 	flutter pub run dart_code_metrics:metrics check-unused-files lib
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}
