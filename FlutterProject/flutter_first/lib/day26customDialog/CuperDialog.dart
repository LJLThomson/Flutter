import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _showDialog2(context);
          },
          child: Text('点击显示弹窗'),
        ),
      ),
    );
  }
}

void _showDialog(widgetContext) {
  showCupertinoDialog(
    context: widgetContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('确认删除'),
        actions: [
          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('取消'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void _showDialog2(widgetContext) {
  showCupertinoDialog(
    context: widgetContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('请评价'),
        content: Text('\n我们很重视您的评价！'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('非常好'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('一般'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('非常差'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('非常差'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
