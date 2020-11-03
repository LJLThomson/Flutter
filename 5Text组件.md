## Text组件详解

![image-20201023005849986](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201023005849986.png)

![image-20201023005858053](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201023005858053.png)

更多参数：https://docs.flutter.io/flutter/painting/TextStyle-class.html

``` dart
Text(
            '各位同学大家好我是主讲老师大地，各位同学大家好我是主讲老师大地',
            textAlign:TextAlign.left,
            overflow:TextOverflow.ellipsis ,
            // overflow:TextOverflow.fade ,
            maxLines: 2,
            textScaleFactor: 1.8,
            style:TextStyle(
                fontSize: 16.0,
                color:Colors.red,
                // color:Color.fromARGB(a, r, g, b)
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                decoration:TextDecoration.lineThrough,
                decorationColor:Colors.white,
                decorationStyle: TextDecorationStyle.dashed,
                letterSpacing: 5.0

            )

        ),
```

### FlutterContainer 组件

![image-20201023010256736](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201023010256736.png)

![image-20201023010308262](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201023010308262.png)