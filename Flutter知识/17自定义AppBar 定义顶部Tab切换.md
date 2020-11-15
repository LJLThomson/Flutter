## FlutterAppBar 自定义顶部导航按钮 图标、颜色 以及 TabBar 定义顶部 Tab 切换

###  AppBar 自定义顶部按钮图 标、颜色

![image-20201108234610036](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201108234610036.png)

————leading 左边控件图标

————actions 右边控件图标

————centerTitle:true, //文字居中

————titleSpacing：文字距离左边图标距离

—————backgroundColor: Colors.red, 背景颜色

————debugShowCheckedModeBanner:false ,  //去掉debug图标

``` dart
class MyApp extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,  //去掉debug图标
      // home:Tabs(),   
      initialRoute: '/appBarDemo',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute     
    );
  }
}

import 'package:flutter/material.dart';

import '../pages/Tabs.dart';
import '../pages/AppBarDemo.dart';

//配置路由
final routes={
      '/':(context)=>Tabs(),
      '/appBarDemo':(context)=>AppBarDemoPage(),    
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};

import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("AppBarDemoPage"), 
        // backgroundColor: Colors.red, 
        centerTitle:true,
        leading: IconButton(
       	  icon: Icon(Icons.search,color: Colors.green),
          onPressed: (){
            print('menu');
          },
        ), 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('search');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              print('settings');
            },
          )
        ],

      ),
      body: Text('1111'),
    );
  }
}
```

