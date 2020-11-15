## AspectRatio、Card

### 1.  AspectRatio  组件

``` dart
AspectRatio 的作用是根据设置调整子元素 child 的宽高比。
AspectRatio 首先会在布局限制条件允许的范围内尽可能的扩展，widget 的高度是由宽 度和比率决定的，类似于 BoxFit 中的 contain，按照固定比率去尽量占满区域。
如果在满足所有限制条件过后无法找到一个可行的尺寸，AspectRatio 最终将会去优先 适应布局限制条件，而忽略所设置的比率。
```

![image-20201107234021784](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201107234021784.png)

``` dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 2.0/1.0,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(  //默认宽度，全屏宽度
        aspectRatio: 3.0/1.0,
        child: Container(
          color: Colors.red,
        ),     
    );
  }
}
```

### 2 Card 组件

![image-20201107235444354](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201107235444354.png![image-20201108001209731](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201108001209731.png)

``` dart

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Card(
          shadowColor: Colors.red,
          color: Colors.red,
          elevation: 30,
          clipBehavior: Clip.antiAliasWithSaveLayer, //当内容超过边界时，需要裁剪，但会造成性能问题，但是可以解决圆角等问题
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          //设置圆角
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(200))),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.network(
                  "https://www.itying.com/images/flutter/2.png",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                      "https://www.itying.com/images/flutter/2.png",
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60),
                ),
                title: Text("xxxx"),
                subtitle: Text("xxxxxxx"),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.network(
                  "https://www.itying.com/images/flutter/3.png",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.itying.com/images/flutter/3.png')),
                title: Text("xxxxxxxx"),
                subtitle: Text("xxxxxxxxxx"),
              )
            ],
          ),
        )
      ],
    );
  }
}
```

——————注意：当内容超过边界时，需要裁剪，但会造成性能问题，但是可以解决圆角等问题。需要使用 clipBehavior: Clip.antiAliasWithSaveLayer