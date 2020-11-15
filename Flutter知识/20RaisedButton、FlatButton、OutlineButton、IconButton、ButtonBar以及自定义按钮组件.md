## Flutter 中的按钮组件

Flutter 里有很多的 Button 组件很多，常见的按钮组件有：RaisedButton、FlatButton、 IconButton、OutlineButton、ButtonBar、FloatingActionButton 等。
RaisedButton ：凸起的按钮，其实就是 Material Design 风格的 Button 

FlatButton ：扁平化的按钮 OutlineButton：线框按钮 

IconButton ：图标按钮 ButtonBar:按钮组 FloatingActionButton:浮动按钮

### 1.属性介绍

![image-20201109235832866](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201109235832866.png)

————onPressed  传null，禁用样式

``` dart
import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("按钮演示页面"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){

              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('普通按钮'),
                  onPressed: () {
                    print("普通按钮");
                  },
                ),
                SizedBox(width: 5),
                RaisedButton(
                  child: Text('颜色按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    print("有颜色按钮");
                  },
                ),
                SizedBox(width: 5),
                RaisedButton(
                  child: Text('阴影按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 20,
                  onPressed: () {
                    print("有阴影按钮");
                  },
                ),
                SizedBox(width: 5),
                RaisedButton.icon(
                    icon: Icon(Icons.search),
                    label: Text('图标按钮'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    // onPressed: null,
                    onPressed: () {
                      print("图标按钮");
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 400,
                  child: RaisedButton(
                    child: Text('宽度高度'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 20,
                    onPressed: () {
                      print("宽度高度");
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      child: Text('自适应按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("自适应按钮");
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('圆角按钮'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      print("圆角按钮");
                    }),
                Container(
                  height: 80,
                  child: RaisedButton(
                      child: Text('圆形按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      splashColor: Colors.red,
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        print("圆形按钮");
                      }),
                ),
                FlatButton(
                  child: Text("按钮"),
                  color: Colors.blue,
                  textColor: Colors.yellow,
                  onPressed: () {
                    print('FlatButton');
                  },
                ),
                SizedBox(width: 10),
                OutlineButton(
                    child: Text("按钮"),
                    //  color: Colors.red,  //没有效果
                    //  textColor: Colors.yellow,
                    onPressed: () {
                      print('FlatButton');
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 50,
                    child: OutlineButton(child: Text("注册"), onPressed: () {}),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[

                    RaisedButton(
                      child: Text('登录'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("宽度高度");
                      },
                    ),
                    RaisedButton(
                      child: Text('注册'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("宽度高度");
                      },
                    ),
                    MyButton(text: "自定义按钮",height: 60.0,width: 100.0,pressed: (){
                      print('自定义按钮');
                    })
                    
                  ],
                )
              ],
            )
          ],
        ));
  }
}


//自定义按钮组件

class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;
  const MyButton({this.text='',this.pressed=null,this.width=80,this.height=30}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed:this.pressed ,
      ),
    );
  }
}
```

1. 普通按钮

   ``` dart
                   RaisedButton(
                     child: Text('普通按钮'),
                     onPressed: () {
                       print("普通按钮");
                     },
                   ),
   ```

2. 颜色按钮

   ``` dart
              RaisedButton(
                     child: Text('颜色按钮'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     onPressed: () {
                       print("有颜色按钮");
                     },
                   ),
   ```

3. 阴影按钮

   ``` dart
                RaisedButton(
                     child: Text('阴影按钮'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     elevation: 20,
                     onPressed: () {
                       print("有阴影按钮");
                     },
                   ),
   ```

4. 自适应按钮

   ``` dart
    Expanded(
                     child: Container(
                       height: 60,
                       margin: EdgeInsets.all(10),
                       child: RaisedButton(
                         child: Text('自适应按钮'),
                         color: Colors.blue,
                         textColor: Colors.white,
                         elevation: 20,
                         onPressed: () {
                           print("自适应按钮");
                         },
                       ),
                     ),
                   )
   ```

5. 设置按钮的形状 非常重要，可以用来画原型图

   ```dart
     Container(
                     height: 80,
                     child: RaisedButton(
                         child: Text('圆形按钮'),
                         color: Colors.blue,
                         textColor: Colors.white,
                         elevation: 20,
                         splashColor: Colors.red,
                         shape:
                             CircleBorder(side: BorderSide(color: Colors.white)),
                         onPressed: () {
                           print("圆形按钮");
                         }),
                   ),
   ```

6. 自定义按钮

   ``` dart
     MyButton(text: "自定义按钮",height: 60.0,width: 100.0,pressed: (){
                         print('自定义按钮');
                       })
                       
   ```

   

总结一下画圆形图方式

1. CircleBorder

2. card

3. BoxDecoration

4. CircleAvator

   