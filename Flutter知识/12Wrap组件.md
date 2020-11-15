## Wrap组件

### 1.FlutterRaisedButton 定义一个按钮
Flutter 中通过 RaisedButton 定义一个按钮。RaisedButton 里面有很多的参数，这一讲我们只 是简单的进行使用。

``` dart
class LayoutDemo extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('女装'),
      textColor: Theme.of(context).accentColor,      
      onPressed: (){        
      },
    );
  }
}
```



### 2.Wrap 组件

Wrap 可以实现流布局，单行的 Wrap 跟 Row 表现几乎一致，单列的 Wrap 则跟 Row 表 现几乎一致。但 Row 与 Column 都是单行单列的，Wrap 则突破了这个限制，mainAxis 上空 间不足时，则向 crossAxis 上去扩展显示。

类似于android 中FlowLayout自适应布局

![image-20201108002729274](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201108002729274.png)

1. direction主轴对齐方式

   ```dart
   import 'package:flutter/material.dart';
   
   void main() => runApp(MyApp());
   
   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) { 
       return MaterialApp(
           home: Scaffold(
           appBar: AppBar(title: Text('FlutterDemo')),
           body: LayoutDemo(),
         ));
     }
   }
   class LayoutDemo extends StatelessWidget {
    @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return Container(
         height: 600,
         width: 400,
         color: Colors.pink,
         padding: EdgeInsets.all(10),
         child: Wrap(
             spacing:10,
             runSpacing: 10,
             direction: Axis.vertical,
             // alignment:WrapAlignment.spaceEvenly,
             // runAlignment: WrapAlignment.center,
             children: <Widget>[
                   MyButton("第1集"),
                   MyButton("第2集"),
                   MyButton("第3集"),
                   MyButton("第4集"),
                   MyButton("第5集"),
                   MyButton("第6集"),
                   MyButton("第7集"),
                   MyButton("第8集"),
                   MyButton("第9集"),
                   MyButton("第10集"),
                   MyButton("第11集"),
                    MyButton("第3集"),
                   MyButton("第4集"),
                   MyButton("第5集"),
                   MyButton("第6集"),
                   MyButton("第7集"),
                   MyButton("第8集"),
                   MyButton("第9集"),
                   MyButton("第10集"),
                   MyButton("第11集"),
             ],
           ),
       );
     }
   }
   
   class MyButton extends StatelessWidget{
     final String text;
     const MyButton(this.text,{Key key}) : super(key: key); 
     @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return RaisedButton(
         child: Text(this.text),
         textColor:Theme.of(context).accentColor,
         onPressed: (){        
         }
       );
     }
   }
   ```

2. Alignment  应该理解为每行或每列对齐方式，从左到右还是，从右到左，或者中间

   ​	注意：只是影响每行或每列的方式

   ``` dart
           alignment:WrapAlignment.end,
   class LayoutDemo extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return Container(
         height: 600,
         width: 400,
         color: Colors.pink,
         padding: EdgeInsets.all(10),
         child: Wrap(
           spacing:10,
           runSpacing: 10,
           direction: Axis.horizontal,
           alignment:WrapAlignment.end,
           children: <Widget>[
             MyButton("第1集"),
             MyButton("第2集"),
             MyButton("第3集"),
             MyButton("第4集"),
             MyButton("第5集"),
             MyButton("第6集"),
             MyButton("第7集"),
             MyButton("第8集"),
             MyButton("第9集"),
             MyButton("第10集"),
             MyButton("第11集"),
             MyButton("第3集"),
             MyButton("第4集"),
             MyButton("第5集"),
             MyButton("第6集"),
             MyButton("第7集"),
             MyButton("第8集"),
             MyButton("第9集"),
             MyButton("第10集"),
             MyButton("第11集"),
           ],
         ),
       );
     }
   }
   
   class MyButton extends StatelessWidget{
     final String text;
     const MyButton(this.text,{Key key}) : super(key: key);
     @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return RaisedButton(
           child: Text(this.text),
           textColor:Theme.of(context).accentColor,
           onPressed: (){
           }
       );
     }
   }
   ```

3. runAlignment 这个是正对整体的，整体居中还是向右或者向左

   ``` dart
           alignment:WrapAlignment.end,
           runAlignment: WrapAlignment.end,
   ```

   