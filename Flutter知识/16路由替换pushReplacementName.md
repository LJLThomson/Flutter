## 路由替换 返回到根 路由

### 1.返回上一级页面

``` dart
Navigator.of(context).pop();
```

### 2.替换路由

比如我们从用户中心页面跳转到了 registerFirst 页面，然后从 registerFirst 页面通过 pushReplacementNamed 跳转到了 registerSecond 页面。这个时候当我们点击 registerSecond 的返回按钮的时候它会直接返回到用户中心。

—————简易：就是替换当前的路由，类似Fragment中replace操作

``` dart
Navigator.of(context).pushReplacementNamed('/registerSecond');
```

### 3. 返回到根路由

``` dart
比如我们从用户中心跳转到 registerFirst 页面，然后从 registerFirst 页面跳转到 registerSecond 页面，然后从 registerSecond 跳转到了 registerThird 页面。这个时候我们想的是 registerThird 注册成功后返回到用户中心。 这个时候就用到了返回到根路由的方法。
```

——————一键返回，类似于Fragment回滚到首页，将中间的Fragment全部置空

``` dart
Navigator.of(context).pushAndRemoveUntil( newMaterialPageRoute(builder:(context)=>newTabs(index:1)), (route)=>route==null );
```

``` dart

class RegisterThirdPage extends StatelessWidget {
  const RegisterThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三步-完成注册")
      ),body:Column(
        children: <Widget>[
          SizedBox(height: 40),
          Text("输入密码完成注册"),
          SizedBox(height: 40),
          RaisedButton(
            child: Text('确定'),
            onPressed: (){
                //返回根
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => new Tabs(index:2)),                  
                   (route) => route == null
                );
            },
          )
        ],
      )
    );
  }
}
```







