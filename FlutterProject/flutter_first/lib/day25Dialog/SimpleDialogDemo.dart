import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  _openSimpleDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('simpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Options A'),
                onPressed: (){
                  // 关闭对话框
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Options B'),
                onPressed: (){
                  // 关闭对话框
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Options C'),
                onPressed: (){
                  // 关闭对话框
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}