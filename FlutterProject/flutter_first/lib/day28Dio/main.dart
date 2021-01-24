import 'package:flutter/material.dart';
import 'package:flutter_first/day27Http/HttpDemo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //标题栏
        appBar: AppBar(
          title: Text("Dialog Demo"),
        ),
        //内容区域
        body: HttpDemo(),
      ),
      //主题
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}