import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {

  _alertDialog() async{//异步等待，值赋予result
    var result=await showDialog (
        context: context,
        builder: (context){
          return  AlertDialog (
            title: Text('System'),
            content: Text('你确定要删除吗？'),
            contentTextStyle:TextStyle(color:Colors.red),
            backgroundColor: Colors.red,
            actions: <Widget>[
              RaisedButton(
                child: Text('取消'),
                onPressed: (){
                  Navigator.pop(context,'cancle');
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

  _showModalBottomSheet() async{
    var result=await showModalBottomSheet(
        context:context,
        builder: (context){
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  focusColor:Colors.blue,
                  title: Text('分享 A'),
                  onTap: (){
                    Navigator.pop(context,'A');
                  },
                ),
                ListTile(
                  title: Text('分享 B'),
                  onTap: (){
                    Navigator.pop(context,'B');
                  },
                ),
                ListTile(
                  title: Text('分享 C'),
                  onTap: (){
                    Navigator.pop(context,'C');
                  },
                ),

              ],
            ),
          );
        }
    );
    print(result);
  }

  _showToast(){//第三方组件
    Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('AlertDialog'),
                  onPressed:_alertDialog
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('SimpleDialog'),
                  onPressed:_simpleDialog
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('showModalBottomSheet'),
                  onPressed:_showModalBottomSheet
              )
            ],
          ),
          Row(//第三方组件
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('toast'),
                  splashColor: Colors.black,
                  onPressed:_showToast
              )
            ],
          )
        ],
      ),
    );
  }
}
