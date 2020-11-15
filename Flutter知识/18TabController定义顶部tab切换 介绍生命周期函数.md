## AppBar自定义顶部导航按钮 图标、颜色 以及 TabBar 定义顶部 Tab 切换

### AppBar 中自定义 TabBar 实 现顶部 Tab 切换

![image-20201109000045341](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201109000045341.png)

____tabs 不可缺少，必要items

——controller不可缺少，与tabs进行一一对应，显示相应的页面

——isScrollable：是否可以滚动，是指tab是否可以滚动显示，而不是指左右滑动，默认false

——label选中颜色

——unSelectedLabelColor:未选中颜色

```dart
import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2 ,
      child: Scaffold(
          appBar: AppBar(
            title:Text("AppBarDemoPage"), 
            // backgroundColor: Colors.red, 
            centerTitle:true,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: (){
            //     print('menu');
            //   },
            // ), 
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.search),
            //     onPressed: (){
            //       print('search');
            //     },
            //   ),
            //   IconButton(
            //     icon: Icon(Icons.settings),
            //     onPressed: (){
            //       print('settings');
            //     },
            //   )
            // ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "热门"),
                Tab(text: "推荐")
              ],
            ),


          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第一个tab")
                  ),
                  ListTile(
                    title:Text("第一个tab")
                  ),
                  ListTile(
                    title:Text("第一个tab")
                  )
                ],
              ),
               ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
```

### AppBar 中自定义 TabBar 实 现 Tabs 的另一种方法。

——————一定要实现with SingleTickerProviderStateMixin 

——————controller: this._tabController,  //注意

``` dart


import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void dispose() {   //生命周期函数
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {   //生命周期函数
    // TODO: implement initState
    super.initState();
    _tabController=new TabController(
      vsync: this,
      length: 2
    );
    // _tabController.addListener((){

    //   print(_tabController.index);     
    // });
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: this._tabController,  //注意
          tabs: <Widget>[
            Tab(text:"热销"),
            Tab(text:"推荐")
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,  //注意
        children: <Widget>[
          Center(child: Text("热销")),
          Center(child: Text("推荐"))

        ],
      ),
    );
  }
}
```





