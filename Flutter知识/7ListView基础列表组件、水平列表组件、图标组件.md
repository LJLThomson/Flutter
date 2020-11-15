## ListView基础列表组件、水平列表组件、图标组件

``` dart
列表布局是我们项目开发中最常用的一种布局方式。 
    Flutter 中我们可以通过 ListView 来定义 列表项，支持垂直和水平方向展示。通过一个属性就可以控制列表的显示方向。列表有一下 分类：
    1、垂直列表 
    2、垂直图文列表 
    3、水平列表
    4、动态列表 
    5、矩阵式列表

```

![image-20201103002410689](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201103002410689.png)

### 案例

``` dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('FlutterDemo')),
          body: HomeContent(),
     ));
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[

          ListTile(
              title: Text(
                '华北黄淮高温持续 南方强降雨今起强势登场',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('中国13家运营波音737MAX航空公司均已提出索赔场',
                style: TextStyle(
                  fontSize: 24
                ),),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华中国13家运营波音737MAX航空公司均已提出索赔登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华北黄淮高温持续 势登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华北黄淮高温起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华北黄淮高雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          ),
           ListTile(
              title: Text('华北黄淮高温持续 南方强降雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，北方今年首轮大范围高温拉开序幕，昨天是高温发展的最鼎盛阶段"),
          )

      ],
    );
  }
}

```

### 案例2 添加leadingIcon和trailingIcon

leading左图   trailing 右图

``` dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('FlutterDemo')),
          body: HomeContent(),
     ));
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[

         
          ListTile(
              leading:Icon(Icons.settings,size:40),
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          ),
          ListTile(              
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
              trailing:Icon(Icons.home),
          ),
          ListTile(
              leading:Icon(Icons.pages),
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          ),
          ListTile(
              leading:Icon(Icons.settings),
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          ),
          ListTile(
              leading:Icon(Icons.home,color: Colors.yellow,),
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          ),
          ListTile(
              leading:Icon(Icons.pages),
              title: Text('华北黄淮高温雨今起强势登场'),
              subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          )
          
      ],
    );
  }
}

```

### 水平列表

``` dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 180.0,           
            color: Colors.red,
          ),
          Container(
            width: 180.0,            
            color: Colors.orange,
            child: ListView(
              children: <Widget>[
                Image.network("https://www.itying.com/images/flutter/1.png"),
                Text('我是一个文本')
              ],
            ),
          ),
          Container(          
            width: 180.0,
            color: Colors.blue,
          ),
          Container(           
            width: 180.0,
            color: Colors.deepOrange,
          ),
          Container(           
            width: 180.0,
            color: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}

```

### 动态列表————自动遍历

``` dart
class HomeContent extends StatelessWidget {  
  //自定义方法
  List<Widget> _getData(){
    return [
        ListTile(
          title: Text("我是一个列表"),
        ),
         ListTile(
          title: Text("我是一个列表"),
        ),
         ListTile(
          title: Text("我是一个列表"),
        )
      ];
  }

  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView(
      children: this._getData(),
    );
  }
}


class HomeContent extends StatelessWidget {  


  //自定义方法
  List<Widget> _getData(){    
    List<Widget> list=new List();
    for(var i=0;i<20;i++){
      list.add(ListTile(
          title: Text("我是$i列表"),
      ));
    }    
    return list;
  }

  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView(
      children: this._getData(),
    );
  }
}
```

### 网络请求listView使用

``` dart
import 'package:flutter/material.dart';

import '../res/listData.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}
class HomeContent extends StatelessWidget {
  //自定义方法
  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return ListTile(
          leading: Image.network(value["imageUrl"]),
          title: Text(value["title"]),
          subtitle: Text(value["author"]));
    });
    // ('124124','124214')
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView(
      children: this._getData(),
    );
  }
}


  List listData=[
      {
          "title": 'Candy Shop',
          "author": 'Mohamed Chahin',
          "imageUrl": 'https://www.itying.com/images/flutter/1.png',
      },
       {
          "title": 'Childhood in a picture',
          "author": 'Google',
          "imageUrl": 'https://www.itying.com/images/flutter/2.png',
      },
      {
          "title": 'Alibaba Shop',
          "author": 'Alibaba',
          "imageUrl": 'https://www.itying.com/images/flutter/3.png',
      },
      {
          "title": 'Candy Shop',
          "author": 'Mohamed Chahin',
          "imageUrl": 'https://www.itying.com/images/flutter/4.png',
      },
       {
          "title": 'Tornado',
          "author": 'Mohamed Chahin',
          "imageUrl": 'https://www.itying.com/images/flutter/5.png',
      },
      {
          "title": 'Undo',
          "author": 'Mohamed Chahin',
          "imageUrl": 'https://www.itying.com/images/flutter/6.png',
      },
      {
          "title": 'white-dragon',
          "author": 'Mohamed Chahin',
          "imageUrl": 'https://www.itying.com/images/flutter/7.png',
      }      

  ];

```



### ListView.builder 中itemBuilder和itemCount方式遍历

``` dart
class HomeContent extends StatelessWidget {  

  List list=new List();
  HomeContent(){
     for(var i=0;i<20;i++){
        this.list.add('我是第$i条');
      }
  }  
  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView.builder(
        itemCount:this.list.length,
        itemBuilder:(context,index){
          return ListTile(
            title: Text(this.list[index]),
          );
        }
    );
  }
}

class HomeContent extends StatelessWidget {  


  //自定义方法
  Widget _getListData(context,index){
        return ListTile(           
            title: Text(listData[index]["title"]),
            leading:Image.network(listData[index]["imageUrl"]),          
            subtitle:Text(listData[index]["author"])
        );
  }

  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView.builder(
        itemCount:listData.length,
        itemBuilder:this._getListData
    );
  }
}
```

