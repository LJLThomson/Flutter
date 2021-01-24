import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class HttpDemo extends StatefulWidget {
  HttpDemo({Key key}) : super(key: key);

  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
    Response result = await Dio().get(apiUrl);

    // print(json.decode(result.data)["result"]);
    setState(() {
      this._list = json.decode(result.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Dio Demo"),
        ),
        body: this._list.length > 0
            ? ListView(
                children: this._list.map((value) {
                  return ListTile(
                    title: Text(value["title"]),
                  );
                }).toList(),
              )
            : Text("加载中..."));
  }
}
