import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Map> imageList = [
    {
      "url":
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581401773519&di=efc809f404c42c8de28f7f829f1d0b51&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170407%2F20170407003743_1f4967f106ba9dd87277f8d5969dc711_5.jpeg"
    },
    {
      "url":
      "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2040389276,2611098741&fm=26&gp=0.jpg"
    },
    {
      "url":
      "https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1629251846,4126644826&fm=26&gp=0.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //标题栏
        appBar: AppBar(
          title: Text("Swiper Demo"),
        ),
        //内容区域
        body: Column(
          children: <Widget>[
            Container(
              //设置宽度100%
              width: double.infinity,
              child: AspectRatio(
                //设置图片宽高比为16：9
                aspectRatio: 16 / 9,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      imageList[index]["url"],
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: this.imageList.length,
                  //配置指示器
                  pagination: new SwiperPagination(),
                  //配置左右箭头
                  //control: new SwiperControl(),
                ),
              ),
            ),
          ],
        ),
      ),
      //主题
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}