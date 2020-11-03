## image图片组件

### 1. 远程图片

``` dart
图片组件是显示图像的组件，Image 组件有很多构造函数，这里我们只给大家讲两个
Image.asset， 本地图片 Image.network 远程图片
```

![image-20201103000042541](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201103000042541.png)

![image-20201103000056173](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201103000056173.png)

``` dart
colorBlenmode 图片和背景颜色混合
```



### 2 本地图片

![image-20201103000503937](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201103000503937.png)

![image-20201103000514337](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201103000514337.png)

``` dart
child:Container( child:Image.asset("images/a.jpeg", fit:BoxFit.cover ), width:300.0, height:300.0, decoration:BoxDecoration( color:Colors.yellow ),}
```

### 3实现圆角图片

1. BorderRadius 实现

   ``` dart
   return Center(
   child: Container(
   width: 300.0,
   height: 300.0,
   decoration: BoxDecoration(
   color: Colors.yellow,
   borderRadius: BorderRadius.circular(150),
   image: DecorationImage(
   image: new NetworkImage('https://www.itying.com/images/201905/thumb_img/1101_thumb_G_15578 45381862.jpg'),
   fit: BoxFit.cover
   )
   ),
   ),
   );
   ```

2. ClipOval 实现圆角

   ``` dart
   returnCenter( child:Container( child:ClipOval( child:Image.network("https://www.itying.com/images/201905/ thumb_img/1101_thumb_G_1557845381862.jpg", width:150.0, height:150.0, ),
   )
   ),
   );
   
   ```

   