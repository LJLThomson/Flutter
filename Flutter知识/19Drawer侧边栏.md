## Flutter Drawer侧边栏、以及侧边栏内容布局

### 1.FlutterDrawer 侧边栏
在 Scaffold 组件里面传入 drawer 参数可以定义左侧边栏，传入 endDrawer 可以定义右侧边 栏。侧边栏默认是隐藏的，我们可以通过手指滑动显示侧边栏，也可以通过点击按钮显示侧 边栏。

![image-20201109232615501](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201109232615501.png)

### 2.DrawerHeader

![image-20201109232834737](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201109232834737.png)

——————decoration  可以设置颜色或者图片

``` dart

import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Category.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key,this.index=0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex;
  _TabsState(index){
    this._currentIndex=index;
  }

  List _pageList=[
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,   //配置对应的索引值选中
          onTap: (int index){
              setState(() {  //改变状态
                  this._currentIndex=index;
              });
          },
          iconSize:36.0,      //icon的大小
          fixedColor:Colors.red,  //选中的颜色
          type:BottomNavigationBarType.fixed,   //配置底部tabs可以有多个按钮
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("分类")
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置")
            )
          ],
        ),

        drawer: Drawer(
          child: Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: DrawerHeader(
                      // child: Text("你好flutter"),
                      child: Icon(Icons.settings),
                      decoration:BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                          image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
                          fit:BoxFit.cover,
                        )
                      )
                    )
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home)
                ),
                title: Text("我的空间"),
              ),
                Divider(),
               ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.people)
                ),
                title: Text("用户中心"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings)
                ),
                title: Text("设置中心"),
              ),
                Divider(),
            ],
          ),


        ),
        endDrawer: Drawer(
          child: Text('右侧侧边栏'),
        ),
      );
  }
}
```

### 3.UserAccountsDrawerHeader

![image-20201109234510716](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201109234510716.png)

——————在Flutter中头像的一种方式，使用CircleAvatar

——————固定写法，不能自定义，如果需要自定义，需要使用DrawerHeader来实现

``` dart

import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Category.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key,this.index=0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex;
  _TabsState(index){
    this._currentIndex=index;
  }

  List _pageList=[
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,   //配置对应的索引值选中
          onTap: (int index){
              setState(() {  //改变状态
                  this._currentIndex=index;
              });
          },
          iconSize:36.0,      //icon的大小
          fixedColor:Colors.red,  //选中的颜色  
          type:BottomNavigationBarType.fixed,   //配置底部tabs可以有多个按钮
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("分类")
            ),
            
             BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置")
            )
          ],
        ),

        drawer: Drawer(
          child: Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: UserAccountsDrawerHeader(
                      accountName:Text("大地老师"),
                      accountEmail: Text("dadi@itying.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage("https://www.itying.com/images/flutter/3.png"),                        
                      ),
                      decoration:BoxDecoration(                        
                        image: DecorationImage(
                          image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
                          fit:BoxFit.cover,
                        )
                        
                      ),
                     otherAccountsPictures: <Widget>[
                       Image.network("https://www.itying.com/images/flutter/4.png"),
                       Image.network("https://www.itying.com/images/flutter/5.png"),
                     ],
                    )
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home)
                ),
                title: Text("我的空间"),
              
              ),
                Divider(),
               ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.people)
                ),
                title: Text("用户中心"),
                onTap: (){
                  Navigator.of(context).pop();  //隐藏侧边栏
                  Navigator.pushNamed(context, '/user');
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings)
                ),
                title: Text("设置中心"),
              ),
                Divider(),
            ],
          ),


        ),
        endDrawer: Drawer(
          child: Text('右侧侧边栏'),
        ),
      );
  }
}
```

### 4.侧边栏路由跳转

``` dart
                onTap: (){
                  Navigator.of(context).pop();  //隐藏侧边栏
                  Navigator.pushNamed(context, '/user');
                },
```

——————drawer 展开也是一个独立页面，回退时，采用 Navigator.of(context).pop();

