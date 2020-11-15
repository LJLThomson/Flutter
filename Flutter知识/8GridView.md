##  GridView组件

一、Flutter 列表组件概述
列表布局是我们项目开发中最常用的一种布局方式。 Flutter 中我们可以通过 ListView 来定义 列表项，支持垂直和水平方向展示。通过一个属性就可以控制列表的显示方向。列表有一下 分类： 1、垂直列表 2、垂直图文列表 3、水平列表 4、动态列表 5、矩阵式列表（网格布局）
二、Flutter GridView 组件的常用参数
当数据量很大的时候用矩阵方式排列比较清晰。此时我们可以用网格列表组件 GridView 实 现布局。
GridView 创建网格列表有多种方式，下面我们主要介绍两种。

1、可以通过 GridView.count 实现网格布局 2、通过 GridView.builder 实现网格布局

![image-20201104232720908](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201104232720908.png)

### 第一种使用方式 GridView.count

``` dart
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, //一行的 Widget 数量
      children: <Widget>[
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本'),
        Text('这是一个文本')
      ],
    );
  }
}
```

``` dart
class LayoutDemo extends StatelessWidget {  


  List<Widget> _getListData() {
      List<Widget> list = new List();

      for (var i = 0; i < 20; i++) {
        list.add(Container(
          alignment: Alignment.center,
          child: Text(
            '这是第$i条数据',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,        
          // height: 400,  //设置高度没有反应
        ));
      }
      return list;
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20.0,
      //水平子 Widget 之间间距
      mainAxisSpacing: 20.0,
      //垂直子 Widget 之间间距
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      //一行的 Widget 数量
      childAspectRatio: 0.7,
      //宽度和高度的比例
      children: this._getListData(),
    );
  }
}
```

——————注意：由于盒子没法设置高度，所以需要根据childAspectRatio宽高比来实现盒子的自适应

—————可以看出没有效果。因为，我们在这里已经指定了每一行分成几列以及宽高比，还有边距等等。所以，我们后面再指定单个item的宽高，已经无效。

```dart
问一个问题，为什么flutter的GridView 里的子项的宽高是由childAspectRatio（子项宽高比）来设置子项的宽高？安卓原生的GridView 宽高可以自己指定，感觉flutter的GridView 这样设置有点不太灵活
```

### 2 通过 GridView.builder 实现网格布局 循环遍历

``` dart
class LayoutDemo extends StatelessWidget {  


  Widget _getListData (context,index) {
        return Container(            
            child:Column(
                children: <Widget>[
                  Image.network(listData[index]['imageUrl']),
                  SizedBox(height: 12),
                  Text(
                    listData[index]['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  )
                ],

            ),
            decoration: BoxDecoration(
              border: Border.all(
                color:Color.fromRGBO(233, 233,233, 0.9),
                width: 1
              )
            ),
              
            // height: 400,  //设置高度没有反应
          );
  }


  @override
  Widget build(BuildContext context) {    
    return GridView.builder(
        
        //注意
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing:10.0 ,   //水平子 Widget 之间间距
          mainAxisSpacing: 10.0,    //垂直子 Widget 之间间距          
          crossAxisCount: 2,  //一行的 Widget 数量
        ),
        itemCount: listData.length,
        itemBuilder:this._getListData,
    );
  }
}
```

————对于`SliverGridDelegateWithMaxCrossAxisExtent`而言，水平方向元素个数不再固定，其水平个数也就是有几列，由`maxCrossAxisExtent`和屏幕的宽度以及`padding`和`mainAxisSpacing`等决定。

例如：我这里的虚拟机宽度为400，当`maxCrossAxisExtent:50`时，有8列；当`maxCrossAxisExtent:100`时，有4列。如下：maxCrossAxisExtent