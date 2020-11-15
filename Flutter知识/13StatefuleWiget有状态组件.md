## Flutter 中自定义有状态组件

在 Flutter 中自定义组件其实就是一个类，这个类需要继承 StatelessWidget/StatefulWidget。
StatelessWidget 是无状态组件，状态不可变的 widget StatefulWidget 是有状态组件，持有的状态可能在 widget 生命周期改变。通俗的讲：如果我 们想改变页面中的数据的话这个时候就需要用到 StatefulWidget

### 1.statefulwiget生命周期

![StatefulWidget生命周期](https://img-blog.csdnimg.cn/20190611104607680.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTI3OTA5NjE=,size_16,color_FFFFFF,t_70)

``` dart
class CouterState extends State<CouterWidgetState> {
  int _couter;
  /// 初始化调用
  @override
  void initState() {
    super.initState();
    _couter = widget.initValue;
    print('initState$_couter');

  }

  /// State对象依赖发生变化调用；系统语言、主题修改，系统也会通知调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
  /// 热重载会被调用，在release下永远不会被调用
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }

  /// 新旧Widget的key、runtimeType不变时调用。也就是Widget.canUpdate=>true
  @override
  void didUpdateWidget(CouterWidgetState oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  /// State在树种移除调用
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  /// State在树中永久移除调用，相当于释放
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  /// 用于子树的渲染
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build');
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_couter'),
          onPressed: (){
            setState(() {
             ++_couter; 
            });
          },
        ),
      ),
    );
  }
}
```

案例：

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo')
        ),
        body: HomePage(),
      )
    );
  }
}


//自定义有状态组件
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countNum=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200),
        Chip(
          label:Text('${this.countNum}') ,
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text('按钮'),
          onPressed: (){
             setState(() {   //只有有状态组件里面才有
                  this.countNum++;
             });
          },
        )
      ],
    );
  }
}
```

### 2 StatelessWidget

无状态组件，点击之后无任何反应

``` dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo')
        ),
        body: HomePage(),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  int countNum=1; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200),
        Text("${this.countNum}"),
        SizedBox(height: 20),
        RaisedButton(
          child: Text("按钮"),
          onPressed: (){
              // setState()   //错误写法       没法改变页面里面的数据
	      this.countNum++;
              print(this.countNum);
          },
        )
      ],
    );
  }
}
```

