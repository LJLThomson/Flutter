## Stack 层叠组件 Stack 与 Align Stack 与 Positioned 实 现定位布局

![image-20201105010654322](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201105010654322.png)

			### 1.alignment控制范围内所有组件显示位置（统一修改）

![image-20201107232228867](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201107232228867.png)

​				alignment是通过范围内比列来实现位置的显示，-1,0,1 

​			——————注意，alignment是指所有的子组件，而不仅仅只是TextView

```dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        alignment: Alignment(1,0.3),
        children: <Widget>[              
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本',style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ))           
        ],
      ),
    );
  }
}

```

### 2.Stack 组件中结合 Align 组件可以控制每个子元素的显示位置

``` dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:  Container(
            height: 400,
            width: 300,
            color: Colors.red,
            child: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment(1,-0.2),
                  child: Icon(Icons.home,size: 40,color: Colors.white),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.search,size: 30,color: Colors.white),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
                )
              ],
            ),
      ),
    );
  }
}
```

### 3 Positioned 精确位置，不在是比例形式

![image-20201107233423267](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201107233423267.png)

``` dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:  Container(
            height: 400,
            width: 300,
            color: Colors.red,
            child: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                //  left: 10,
                  child: Icon(Icons.home,size: 40,color: Colors.white),
                ),
                Positioned(
                 bottom: 0,
                 left: 100,
                  child: Icon(Icons.search,size: 30,color: Colors.white),
                ),
                Positioned(
                  right: 0,
                  child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
                )
              ],
            ),
      ),
    );
  }
}
```









