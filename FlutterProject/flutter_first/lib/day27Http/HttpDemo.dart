import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpDemo extends StatefulWidget {
  HttpDemo({Key key}) : super(key: key);

  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl = "http://a.itying.com/api/productlist";
    final http.Response result = await http.get(apiUrl); //
    if (result.statusCode == 200) {
      print(result.body);
      setState(() {
        this._list = json.decode(result.body)["result"];

        /*
      {
        "result": [{
            "_id": "5ac0896ca880f20358495508",
            "title": "精选热菜",
            "pid": "0",
          }, {
            "_id": "5ac089e4a880f20358495509",
            "title": "特色菜",
            "pid": "0",

          }
        ]
      }
      */
      });
    } else {
      print("失败${result.statusCode}");
    }
  }

  _postData() async {
    var apiUrl = "http://192.168.0.5:3000/dologin";

    var result = await http.post(apiUrl, body: {'username': '张三', 'age': '20'});
    if (result.statusCode == 200) {
      print(json.decode(result.body));
    } else {
      print(result.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Demo"),
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
