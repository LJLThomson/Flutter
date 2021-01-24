

### Dialog弹框

### 1.AlertDialog弹框

Flutter AlertDialog对话框是一个警报对话框，会通知用户需要确认的情况。警报对话框具有可选标题和可选的操作列表。

| 属性             | 说明                                                         |
| ---------------- | ------------------------------------------------------------ |
| title            | 标题                                                         |
| titlePadding     | 标题内边距                                                   |
| titleTextStyle   | 标题文字样式                                                 |
| content          | 内容                                                         |
| contentPadding   | 内容 内边距 默认EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), |
| contentTextStyle | 内容文字样式                                                 |
| actions          | 对话框下边的Widget组件集合                                   |
| backgroundColor  | 背景颜色                                                     |
| elevation        | 阴影高度                                                     |
| semanticLabel    |                                                              |
| shape            | 形状                                                         |

barrierDismissible ——————默认退出

``` dart
_alertDialog() async{//异步等待，值赋予result
    var result=await showDialog (
        context: context,
        builder: (context){
          return  AlertDialog (
            title: Text('System'),
            content: Text('你确定要删除吗？'),
            actions: <Widget>[
              RaisedButton(
                child: Text('取消'),
                onPressed: (){
                  Navigator.pop(context,'cancle'); // 退出
                },
              ),
              RaisedButton(
                child: Text('确定'),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
    print(result);//cancle
  }
```

### 2.simpleDialog

``` dart
_simpleDialog() async{
    var result=await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text('选择了内容'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('one'),
                onPressed: (){
                  Navigator.pop(context,'one');
                },
              ),
              SimpleDialogOption(
                child: Text('two'),
                onPressed: (){
                  Navigator.pop(context,'two');
                },
              ),
              SimpleDialogOption(
                child: Text('three'),
                onPressed: (){
                  Navigator.pop(context,'three');
                },
              )
            ],
          );
        });
    print(result);
  }
```

### 3.showModalBottomSheet

``` dart
_simpleDialog() async{
    var result=await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text('选择了内容'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('one'),
                onPressed: (){
                  Navigator.pop(context,'one');
                },
              ),
              SimpleDialogOption(
                child: Text('two'),
                onPressed: (){
                  Navigator.pop(context,'two');
                },
              ),
              SimpleDialogOption(
                child: Text('three'),
                onPressed: (){
                  Navigator.pop(context,'three');
                },
              )
            ],
          );
        });
    print(result);
  }
```

### 4. toast  和[fluttertoast](https://pub.dev/packages/fluttertoast)

1. 搜索toast 查看说明使用

   ```yaml
   toast: ^0.1.5
   ```

   ![image-20201116234238779](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201116234238779.png)

2. flutterToast

   ```yaml
   fluttertoast: ^7.1.1
   ```

```dart
Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
```

```dart
FToast fToast;

@override
void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
}

_showToast() {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.check),
            SizedBox(
            width: 12.0,
            ),
            Text("This is a Custom Toast"),
        ],
        ),
    );


    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
    );
    
    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
}
```

### 5. 自定义Dialog

1. 简单用法

   ``` dart
   showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return CustomDialog(
          title: '这是一个标题',
          content: '这里是弹窗的提示内容',
        );
      }
    );
   ```

2. **自定义确定按钮颜色**

   ``` dart
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (_) {
       return CustomDialog(
         title: '这是一个标题',
         content: '这里是弹窗的提示内容',
         isCancel: true,
         confirmColor: Colors.green[400]
       );
     }
   );
   ```

3. **带图片的Dialog**

   ``` dart
   
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (_) {
       return CustomDialog(
         image: './images/ic_success.png',
         imageHintText: '数据加载成功'
       );
     }
   );
   ```

4. **Dialog按钮点击回调监听**

   ``` dart
   
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (_) {
       return CustomDialog(
         title: '这是一个标题',
         content: '这里是弹窗的提示内容',
         confirmCallback: () {
           print('-----------点击了确定按钮');
         },
       );
     }
   );
   ```

   

案例：定时器，延迟3秒之后消失

``` dart

import 'package:flutter/material.dart';

import 'dart:async';

class MyDialog extends Dialog {
  String title;
  String content;
  MyDialog(this.title, this.content);

  //定时器，3秒后自动关闭dialog
  _showTimer(context) {
    Timer.periodic(Duration(milliseconds: 3000), (t) {
      Navigator.pop(context);
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {

    _showTimer(context);
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 200,
          width: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("${this.title}"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  "${this.content}",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

 案例：相片选择器

``` dart


import 'package:flutter/material.dart';

class ImagePickerDialog extends StatefulWidget {
  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  _dismissDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _dismissDialog,
              child: Container(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '拍照',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '从手机相册选择',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(height: 10, color:Colors.black),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### 6. CupertinoAlertDialog IOS风格

``` dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _showDialog2(context);
          },
          child: Text('点击显示弹窗'),
        ),
      ),
    );
  }
}

void _showDialog(widgetContext) {
  showCupertinoDialog(
    context: widgetContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('确认删除'),
        actions: [
          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('取消'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void _showDialog2(widgetContext) {
  showCupertinoDialog(
    context: widgetContext,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('请评价'),
        content: Text('\n我们很重视您的评价！'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('非常好'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('一般'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('非常差'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('非常差'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
```

