import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

//自定义组件
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:Text(
        '你好Flutter 111我的沙发上的飞机啊大煞风景阿斯兰的房间啊了发生的叫法两地分居都是风景阿里山的阿凡达',
        textDirection: TextDirection.ltr,
        maxLines: 2,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.yellow,
            backgroundColor: Colors.red,
            // color: Color.fromRGBO(244, 233, 121, 0.5),
        ),
      )
    );
  }

}