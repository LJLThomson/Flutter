
import 'package:flutter/material.dart';

import 'dart:async';

class MyDialog extends Dialog {
  String title;
  String content;
  MyDialog(this.title, this.content);

  //定时器，3秒后自动关闭dialog
  _showTimer(context) {
    Timer.periodic(Duration(milliseconds: 3000), (t) {
      Navigator.pop(context);
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {

    _showTimer(context);
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 200,
          width: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("${this.title}"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  "${this.content}",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}