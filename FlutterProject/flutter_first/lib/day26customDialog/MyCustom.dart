import 'package:flutter/material.dart';
import 'MyDialog.dart';
import 'ImagePickerDialog.dart';
import 'package:flutter/cupertino.dart';

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
        body: DatePickerPubPage(),
      ),
      //主题
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class DatePickerPubPage extends StatefulWidget {
  @override
  _DatePickerPubPageState createState() => _DatePickerPubPageState();
}

class _DatePickerPubPageState extends State<DatePickerPubPage> {
  _showCuperDialog(widgetContext) {
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
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("自定义Dialog"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyDialog("关于我们", "我是内容");
                  });
            },
          ),
          RaisedButton(
            child: Text("自定义Dialog"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ImagePickerDialog();
                  });
            },
          ),
          RaisedButton(
            child: Text("自定义Dialog2"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showCuperDialog(context);
                  });
            },
          ),
        ],
      ),
    );
  }
}
