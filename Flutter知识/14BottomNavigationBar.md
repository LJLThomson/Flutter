## BottomNavigationBar

### 1.BottomNavigaitonBar

BottomNavigationBar 是底部导航条，可以让我们定义底部 Tab 切换，bottomNavigationBar 是 Scaffold 组件的参数。

![image-20201108222826118](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201108222826118.png)

——————type模式，shifting，则是动画形式

``` dart

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        body: Text("tabBar"),
        fixedColor: Colors.red,
        iconSize: 20, //调整icon大小
        fixedColor:Colors.red,  //选中的颜色
        type:BottomNavigationBarType.fixed,   //配置底部tabs可以有多个按钮
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (int index){
              print(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 5), // 这里也可以调整icon大小
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
      );
  }
}
```

小技巧：如果不需要文字，图标居中，如何显示

``` dart
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Container()
          )
```

案例：实现按钮点击切换

``` dart

class _TabsState extends State<Tabs> {

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Text("tabBar"),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex=index;
          });
        },
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
    );
  }
}
```

额外属性：可以在BottomNavigationBarItem中设置

``` dart
            backgroundColor: Colors.red,
            fixedColor: Colors.green,
            selectedFontSize:12,
            unselectedFontSize: 14,
```



### 2.BottomNavigationBarItem

![image-20201108223837294](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201108223837294.png)

——————注意title现在被label代替了



``` dart
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Tabs()
    );
  }
}


class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Text("tabBar"),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex=index;
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
              activeIcon: Icon(Icons.settings),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("分类"),
              backgroundColor: Colors.red
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置")
          )
        ],
      ),
    );
  }
}
```

