## Flutter入口介绍以及组件介绍

### 一、目录结构

![image-20201023001937924](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201023001937924.png)

``` dart
android android 平台相关代码
ios ios 平台相关代码
lib flutter 相关代码，我们主要编写的代 码就在这个文件夹 test 用于存放测试代码
pubspec.yaml 配置文件，一般存放一些第三方库的依
```

### 二、Flutter 入口文件、入口方法

1. 入口函数

   ``` dart
   voidmain(){ runApp(MyApp()); }
   也可以简写 voidmain()=>runApp(MyApp());
   ```

### 三、Flutter 第一个 Demo Center 组件的 使用

​	居中显示

### 四、自定义组件

前期我们都继承 StatelessWidget。后期给大家讲 StatefulWidget 的使用。 StatelessWidget 是无状态组件，状态不可变的 widget StatefulWidget 是有状态组件，持有的状态可能在 widget 生命周期改变

```dart
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
        '你好Flutter 111',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.yellow,
            // color: Color.fromRGBO(244, 233, 121, 0.5),
        ),
      )
    );
  }
}
```

### 五、给 Text 组件增加一些装饰

``` dart

const Text(
    this.data, {
    Key key,
    this.style,  //重要，继承TextStyle
    this.strutStyle,
    this.textAlign,
    this.textDirection, //文字方向
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,   // 多行
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) 
    
const TextStyle({
    this.inherit = true,
    this.color, //文字颜色
    this.backgroundColor, //文字背景颜色
    this.fontSize,  // 大小
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
  })
```

### 六、件用MaterialApp 和 Scaffold两个组件 装饰 App

``` dart
MaterialApp 是一个方便的 Widget，它封装了应用程序实现 Material Design 所需要的
一些 Widget。一般作为顶层widget 使用。
s常用的属性：
home（主页） title（标题） color（颜色） theme（主题） routes（路由） 
```

2、Scaffold
Scaffold 是 Material Design 布局结构的基本实现。此类提供了用于显示 drawer、
snackbar和底部 sheet 的API。
Scaffold 有下面几个主要属性：
appBar - 显示在界面顶部的一个 AppBar。
body - 当前界面所显示的主要内容 Widget。
drawer - 抽屉菜单控件。

案例：通过Scaffold调整appBar和主题颜色

``` dart
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar( 
            title:Text('Flutter Demo')
        ),
        body:HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.yellow //定义主题颜色
      ),
    );
  }
}
```



