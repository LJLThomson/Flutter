## dart知识

### 一、dart变量 常量 命名规则

1. 变量

```dart
var str = 'this is var';
int num = 20;
```

脚本类型语言，自动推导

2. 常量

   const值：一开始就需要赋值，值不变

   final:运行时赋值，只赋值一遍，对象不能修改

3. 命名规则

   与其他语言一致

### 二、入口方法

```da
main(){
    print('你好dart');
 }
void main(){
 print('你好dart');
}
```

### 三数据类型

``` java
 常用数据类型：
      Numbers（数值）:
          int
          double
      Strings（字符串）
          String
      Booleans(布尔)
          bool
      List（数组）
          在Dart中，数组是列表对象，所以大多数人只是称它们为列表
      Maps（字典）
          通常来说，Map 是一个键值对相关的对象。 键和值可以是任何类型的对象。每个 键 只出现一次， 而一个值则可以出现多次
```

1. string字符串使用

   ``` dart
   var str = '你好'；
   var str2 = "你不是"；
   print('$str1 $str2');
   
   创建char类型，现在也将char
   String str3 = new String.fromCharCode(98);
   ```

2. 数值类型

   ``` dart
      var a2 = 123;
     var b2 = 45.0; 
    print(a2 is double);
     print(b2 is num);
   ```

3. bool类型

   ``` dart
   bool a = false;
     print(c is bool);
   ```

4. list集合

   ``` dart
   //第一种方式
   var l1=['aaa','bbbb','cccc'];
   
   //第二方式 任意类型
    var mlist = List();
     mlist.add(2);
     mlist.add('bbb');
     mlist.add(true);
     print(mlist.length);
     print(mlist[0]);
     print(mlist[1]);
     print(mlist[2]);
     print(mlist);
   //第三中方式 声明类型
     var mlist2 = new List<String>();
   
   ```

5. Maps类型

   ``` dart
   //第一种类型
     var m = Map();
     m['name'] = 'zhangsan';
     m['age'] = 27;
     print(m);
   //第二种类型
     var map = Map<String, String>();
     map['name'] = 'nihao';
     map['age'] = '27';
   ```

6. 类型判断

   ``` dart
     var d = 23.0;
     if (d is double) {
       print('yes');
     } else {
       print('NO');
     }
   ```

### 四运算

``` dart
/**
 算术运算符

      +    -    *    /     ~/ (取整)     %（取余）
      
    关系运算符

      ==    ！=   >    <    >=    <=

    逻辑运算符

        !  &&   ||

    赋值运算符

     基础赋值运算符   =   ??=
     复合赋值运算符   +=  -=  *=   /=   %=  ~/=
*/
```

1. 算术运算符

   ``` dart
     int a=13;
     int b=5;
   
     print(a+b);   //加
     print(a-b);   //减
     print(a*b);   //乘
     print(a/b);   //除
     print(a%b);   //其余
     print(a~/b);  //取整
   注意：与其他语言不一样，a/b得到具体值， a~/b 取整
   ```

2. 关系运算符

   ``` dart
    int a=5;
     int b=3;
   
     print(a==b);   //判断是否相等
     print(a!=b);   //判断是否不等
     print(a>b);   //判断是否大于
     print(a<b);   //判断是否小于
     print(a>=b);   //判断是否大于等于
     print(a<=b);   //判断是否小于等于
   ```

3. 逻辑运算符

   ``` dart
   && || & |  
   ```

4. 赋值运算符

   ``` dart
   var a=4;
   
      a*=3;  //a=a*3;
   
      print(a);
   ```

5. 条件表达式

   ``` dart
   1. if else
   2. switch case 
         switch (b) {
       case 3:
         break;
       default:
     }
   3.三目运算符
     var c2 = b == null ? 2 : 3;
   4.判空处理
       var c2 = b??10;
   b不为空，则直接复制给c2，为空，10赋值给c2
   ```

6. 类型转换

   ``` dart
   1、Number与String类型之间的转换
     String str='123';
     var myNum=int.parse(str);
     String str='123.1';
     var myNum=double.parse(str);
   2.Number类型转换成String类型 toString()
     var b2 = 3;
     var c = b2.toString();
     print(c is String);
   3.判断字符串是否为空
       str.isEmpty
   4.判断 不是数字
       var myNum = 0 / 0;
   myNum.isNaN
   ```

7. ++ -- 运算

   ``` dart
   在赋值运算里面 如果++ -- 写在前面 这时候先运算 再赋值，如果++ --写在后面 先赋值后运行运算
       var a=10;
       var b=a--;
       print(a);  //9
       print(b);  //10
   ```

### 五循环语句

``` dart
1. for循环
  for(int i=1;i<=10;i++){
	 print(i);
  }
 //4、定义一个二维数组 打印里面的内容

        List list=[
          {
              "cate":'国内',
              "news":[
                {"title":"国内新闻1"},
                {"title":"国内新闻2"},
                {"title":"国内新闻3"}
              ]
          },
          {
              "cate":'国际',
              "news":[
                {"title":"国际新闻1"},
                {"title":"国际新闻2"},
                {"title":"国际新闻3"}
              ]
          }
        ];

        /*
        国内
            国内新闻1
            国内新闻2
            国内新闻3
        国际
            国际新闻1
            国际新闻2
        */


        for(var i=0;i<list.length;i++){
            print(list[i]["cate"]);
            print('-------------');
            for(var j=0;j<list[i]["news"].length;j++){
                print(list[i]["news"][j]["title"]);
            }
        }

```

2.for in语句

``` dart
  List mlist = List();
  mlist.add('wode');
  mlist.add('wos');
  mlist.add(3);
  for (var str in mlist) {
    print(str);
  }
 
forEach：
 mlist.forEach((element) {
    print(element);
  });
  
```

3.while do...while

``` dart
建议多使用for循环
```

4.continue和break

``` dart
continue 跳过当前，继续执行
break 跳出一层for，继续执行
```

### 六  list 和Map详解

1. list常用属性

   ``` dart
   /*
   List里面常用的属性和方法：
   
       常用属性：
           length          长度
           reversed        翻转
           isEmpty         是否为空
           isNotEmpty      是否不为空
       常用方法：  
           add         增加
           addAll      拼接数组
           indexOf     查找  传入具体值
           remove      删除  传入具体值
           removeAt    删除  传入索引值
           fillRange   修改   
           insert(index,value);            指定位置插入    
           insertAll(index,list)           指定位置插入List
           toList()    其他类型转换成List  
           join()      List转换成字符串
           split()     字符串转化成List
           forEach   
           map
           where
           any
           every
   
   */
   常用：
   List myList=['香蕉','苹果','西瓜'];
   myList.add('桃子'); 
   myList.remove('西瓜');
   myList.removeAt(1);
   myList.indexOf('苹x果')；
   mlist.insert(1, '西红柿');

   join List转换成字符串:
     List myList = ['香蕉', '苹果', '西瓜'];
     var str = myList.join('-'); //list转换成字符串
     print(str);
   split()     字符串转化成List:
     var str = '香蕉-苹果-西瓜';
     var list = str.split('-');
     print(list);
     print(list is List);
   ```

2. set集合

   ``` dart
   //用它最主要的功能就是去除数组重复内容,
   //Set是没有顺序且不能重复的集合，所以不能通过索引去获取值，非是无须，而是以Hash值排序
     List myList = ['香蕉', '苹果', '西瓜', '香蕉', '苹果', '香蕉', '苹果'];
     var s = Set();
     s.addAll(myList);
     print(s);
     print(s.toList());
     print(myList);
   
     s.forEach((element) {
       print(s);
     });
   ```

3. map集合

   ``` dart
   /*
     映射(Maps)是无序的键值对：
       常用属性：
           keys            获取所有的key值
           values          获取所有的value值
           isEmpty         是否为空
           isNotEmpty      是否不为空
       常用方法:
           remove(key)     删除指定key的数据
           addAll({...})   合并映射  给映射内增加属性
           containsValue   查看映射内的值  返回true/false
           forEach   
           map
           where
           any
           every
   */
     Map person={
       "name":"张三",
       "age":20
     };
    persons.keys  所有keys  (张三, 20)
    persons.values 所有values (张三, 20)
    print(person.keys.toList());
     print(person.values.toList());
     person.values.forEach((element) {
       print(element);
     });
     person.values.toList().forEach((element) {
       print(element);
     });
   
   contains:
   
     Map person2 = {"name": "张三", "age": 20, "sex": "男"};
     print(person2.containsValue('张三'));
   
   ```

3. 循环方法以及高阶函数

   ``` dart
   1.map
     List myList = [1, 3, 4];
     var newList = myList.map((value) {
       return value * 2;
     });
     print(newList.toList());
    [2, 6, 8]
   2. any
    List myList=[1,3,4,5,7,8,9];
     var f=myList.any((value){   //只要集合里面有满足条件的就返回true
         return value>5;
     });
   3.every
     List myList=[1,3,4,5,7,8,9];
     var f=myList.every((value){   //每一个都满足条件返回true  否则返回false
         return value>5;
     });
     print(f);
   4. where  从什么地方开始
     List myList = [1, 3, 4, 5, 7, 8, 9];
     var newList = myList.where((value) {
       return value > 5;
     });
     print(newList.toList());
    [7, 8, 9]
   5 forEach
     Map person = {"name": "张三", "age": 20};
     person.forEach((key, value) {
       print("$key---$value");
     });
   ```

### 七 函数

1. 方法内部还可以存在方法，类似于javadcript，作用域为方法内部

``` dart
 //演示方法的作用域
  void xxx() {
    aaa() {
      print(getList());
      print('aaa');
    }
    aaa();
  }
  // aaa();  错误写法
  xxx(); //调用方法
```

2. 默认传参

   ``` dart
   1、定义一个方法然后打印用户信息
     String printUserInfo(String username,int age){  //行参
         return "姓名:$username---年龄:$age";
     }
     print(printUserInfo('张三',20)); //实参
   2.定义一个带可选参数的方法,age为可选参数
     String printUserInfo(String username,[int age]){  //行参
       if(age!=null){
         return "姓名:$username---年龄:$age";
       }
       return "姓名:$username---年龄保密";
     }
   print(printUserInfo('张三',21)); //实参
   print(printUserInfo('张三'));
   3.定义一个带默认参数，必须按照顺序
       String printUserInfo(String username,[String sex='男',int age]){  //行参
       if(age!=null){
         return "姓名:$username---性别:$sex--年龄:$age";
       }
       return "姓名:$username---性别:$sex--年龄保密";
     }
     print(printUserInfo('张三'));
     print(printUserInfo('小李','女'));
     print(printUserInfo('小李','女',30));
   4.定义一个命名参数的方法，无须自带顺序，但需要写上参数名
     String printUserInfo(String username, {int age, String sex = '男'}) {
       //行参
       if (age != null) {
         return "姓名:$username---性别:$sex--年龄:$age";
       }
       return "姓名:$username---性别:$sex--年龄保密";
     }
     print(printUserInfo('张三', sex: '未知'));
   5.方法作为参数使用
       定义传参的函数
       void fn2(fn) {
       fn();//执行fn方法
   }
   
     int a(int b) {
       return b;
     }
     int a2(a3) {
       return a3(3);
     }
     var c = a2(a);
     print(c);
   ```

### 八 箭头函数，匿名函数，闭包原理

 1.箭头函数

``` dart
list.forEach((value)=>print(value));
map:
   var newList=list.map((value){
        if(value>2){
          return value*2;
        }
        return value;
    });
    print(newList.toList());
```

2. 匿名函数

   ``` dart
   1.匿名函数 
   var printNum = () {
       print(123);
     };
     printNum();
   2.自执行函数，与javascript一致
     ((int n) {
       print(n);
     })(12);
   3.递归
     阶乘
     var sum=1;
     fn(n){
         sum*=n;
         if(n==1){
           return ;
         }
         fn(n-1);
     }
     fn(5);
     加法： //通过方法的递归 求1-100的和
     var sum = 0;
     fn(int n) {
       sum += n;
       if (n == 0) {
         return;
       }
   fn(n - 1);
     }
     fn(100);
   
   ```

3. 闭包原理

   ``` dart
   /*
   闭包：
   
       1、全局变量特点:    全局变量常驻内存、全局变量污染全局
       2、局部变量的特点：  不常驻内存会被垃圾机制回收、不会污染全局  
   
     /*  想实现的功能：
           1.常驻内存     
           2.不污染全局   
             产生了闭包,闭包可以解决这个问题.....  
             闭包: 函数嵌套函数, 内部函数会调用外部函数的变量或参数, 变量或参数不会被系统回收(不会释放内存)
   	      闭包的写法： 函数嵌套函数，并return 里面的函数，这样就形成了闭包。
       */  
   */
     fn() {
       var a = 123; /*不会污染全局   常驻内存*/
       return () {
         a++;
         print(a);
       };
     }
     var b = fn();
     b();
     b();
     b();
   124
   125
   126
       如何简单理解闭包原理： 万物皆对象，方法也是，方法中存在的成员变量皆对象，所以 () {
         a++;
         print(a);
       };a就是b方法中的一个对象，根据垃圾回收机制（一般是根节点方式，类似java），所以b对象（函数）不能退出，那么成员变量a对象就不能退出，形成闭包。
   ```

### 九面向对象和类

1. 面向对象，封装、继承、多态 ,注意，dart语言不是以class类作为导入的，与java不同，它是分模块形式

``` dart
/*

面向对象编程(OOP)的三个基本特征是：封装、继承、多态      

      封装：封装是对象和类概念的主要特性。封装，把客观事物封装成抽象的类，并且把自己的部分属性和方法提供给其他对象调用, 而一部分属性和方法则隐藏。
                
      继承：面向对象编程 (OOP) 语言的一个主要功能就是“继承”。继承是指这样一种能力：它可以使用现有类的功能，并在无需重新编写原来的类的情况下对这些功能进行扩展。
            
      多态：允许将子类类型的指针赋值给父类类型的指针, 同一个函数调用会有不同的执行效果 。


Dart所有的东西都是对象，所有的对象都继承自Object类。

Dart是一门使用类和单继承的面向对象语言，所有的对象都是类的实例，并且所有的类都是Object的子类

一个类通常由属性和方法组成。

*/
    Object a=123;
    Object v=true;
    print(a);
    print(v);
```

2. 创建类

   ``` dart
   class Person{
     String name="张三";
     int age=23;
     void getInfo(){
         // print("$name----$age");
         print("${this.name}----${this.age}");
     }
     void setInfo(int age){
       this.age=age;
     }
   }
   
   
   Person p1=new Person();
     // print(p1.name);
     p1.setInfo(28);
     p1.getInfo();
   ```

3. 构造方法 ——————注意，没有重载的概念，可以通过命名构造

   ``` dart
   1.没有重载的概念，可以通过命名函数或者可选参数的形式传参
   class Person {
     String name;
     int age;
     //默认构造函数的简写
     Person() {} 
     Person(this.name, this.age);//错误，多个Person
       //等价于
     // Person(String name,int age){
     //     this.name=name;
     //     this.age=age;
     // }
     void printInfo() {
       print("${this.name}----${this.age}");
     }
   }
   2. 命名构造参数
   /*
   dart里面构造函数可以写多个
   */
   class Person {
     String name;
     int age;
     //默认构造函数的简写
     Person(this.name, this.age);
   
     Person.now() {
       print('我是命名构造函数');
     }
     Person.now2(String name, int age) {
       this.name = name;
       this.age = age;
     }
   
     Person.setInfo(String name, int age) {
       this.name = name;
       this.age = age;
     }
   
     void printInfo() {
       print("${this.name}----${this.age}");
     }
   }
    void main() {
     // var d = new DateTime.now(); //实例化DateTime调用它的命名构造函数
     // print(d);
   
     Person p1 = new Person('张三', 20); //默认实例化类的时候调用的是 默认构造函数
   
     Person p2 = new Person.now(); //命名构造函数
   
     // Person p1 = Person.setInfo('李四', 30);
     // p1.printInfo();
     Person p3 = Person.now2('zhangsan', 22);
     p3.printInfo();
   }
      
   ```

4. 私有方法

   ``` dart
   但是我们可以使用_把一个属性或者方法定义成私有。
   class Animal{
     String _name;   //私有属性
     int age; 
   }
   ```

5. getter和setter修饰符

   ``` dart
   class Rect{
     num height;
     num width; 
     Rect(this.height,this.width);
     get area{
       return this.height*this.width;
     }
     set areaHeight(value){
       this.height=value;
     }
   }
   
   void main(){
     Rect r=new Rect(10,4);
     // print("面积:${r.area()}");   
     r.areaHeight=6;
     print(r.area);
   }
   解答：与其说setter和getter函数，不如这里是将area和areaHeight变成成员变量，方法对象
   ```

6. 初始化列表

   ``` dart
   // Dart中我们也可以在构造函数体运行之前初始化实例变量
   class Rect {
     int height;
     int width;
     Rect()
         : height = 2,
           width = 10 {
       print("${this.height}---${this.width}");
     }
     getArea() {
       return this.height * this.width;
     }
   }
    Rect r = new Rect();
    print(r.getArea());
   ```

### 十类继承，静态成员

1. 静态成员方法

   ``` dart
   class Person {
     static String name = '张三';
     int age = 20;
   
     static void show() {
       print(name);
     }
   ```

2. 对象操作符

   ``` dart
   /*
   Dart中的对象操作符:
   
       ?     条件运算符 （了解）
       as    类型转换
       is    类型判断
       ..    级联操作 （连缀）  (记住)
   */
   
   class Person {
     String name;
     num age;
     Person(this.name, this.age);
     void printInfo() {
       print("${this.name}---${this.age}");
     }
   }
     Person p;
     p?.printInfo();
   
     Person p=new Person('张三', 20);
     if(p is Person){
         p.name="李四";
     }
   (p1 as Person).printInfo();
     p1
       ..name = "李四"
       ..age = 30
       ..printInfo();
   ```

3. 类继承

   1.简单继承

   ``` dart
   class Person {
     String name = '张三';
     num age = 20;
     void printInfo() {
       print("${this.name}---${this.age}");
     }
   }
   
   class Web extends Person {}
   main() {
     Web w = new Web();
     print(w.name);
     w.printInfo();
   }
   ```

   2. super关键字 与java用法一样

      ``` dart
      class Web extends Person{
        Web(String name, num age) : super(name, age){
        }  
      }
      /*
      Dart中的类的继承：  
          1、子类使用extends关键词来继承父类
          2、子类会继承父类里面可见的属性和方法 但是不会继承构造函数
          3、子类能复写父类的方法 getter和setter
      */
      
      class Person {
        String name;
        num age; 
        Person(this.name,this.age);
        void printInfo() {
          print("${this.name}---${this.age}");  
        }
      }
      
      
      class Web extends Person{
        String sex;
        Web(String name, num age,String sex) : super(name, age){
          this.sex=sex;
        }
        run(){
         print("${this.name}---${this.age}--${this.sex}");  
        }
        
      }
      
      ```

3. 其他用法与java一样

### 十一 抽象类与多态和接口

1. abstract 可以当作抽象类和接口来使用

``` dart
/*
Dart中抽象类: Dart抽象类主要用于定义标准，子类可以继承抽象类，也可以实现抽象类接口。
  1、抽象类通过abstract 关键字来定义
  2、Dart中的抽象方法不能用abstract声明，Dart中没有方法体的方法我们称为抽象方法。
  3、如果子类继承抽象类必须得实现里面的抽象方法
  4、如果把抽象类当做接口实现的话必须得实现抽象类里面定义的所有属性和方法。
  5、抽象类不能被实例化，只有继承它的子类可以
extends抽象类 和 implements的区别：
  1、如果要复用抽象类里面的方法，并且要用抽象方法约束自类的话我们就用extends继承抽象类
  2、如果只是把抽象类当做标准的话我们就用implements实现抽象类
案例：定义一个Animal 类要求它的子类必须包含eat方法
*/
abstract class Animal{
  eat();   //抽象方法
  run();  //抽象方法  
  printInfo(){
    print('我是一个抽象类里面的普通方法');
  }
}
class Dog extends Animal{
  @override
  eat() {
     print('小狗在吃骨头');
  }

  @override
  run() {
    // TODO: implement run
    print('小狗在跑');
  }  
}
```

2. 多态,与java一致

   ``` dart
   /*
   Datr中的多态：
       允许将子类类型的指针赋值给父类类型的指针, 同一个函数调用会有不同的执行效果 。
       子类的实例赋值给父类的引用。
      多态就是父类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现。
   */
   abstract class Animal{
     eat();   //抽象方法 
   }
   class Dog extends Animal{
     @override
     eat() {
        print('小狗在吃骨头');
     }
     run(){
       print('run');
     }
   }
   class Cat extends Animal{
     @override
     eat() {   
       print('小猫在吃老鼠');
     }
     run(){
       print('run');
     }
   }
   
   
     Animal d=new Dog();
     d.eat();
     Animal c=new Cat();
     c.eat();
   ```

3. 接口 implements

   ``` dart
   /*
   和Java一样，dart也有接口，但是和Java还是有区别的。
   
     首先，dart的接口没有interface关键字定义接口，而是普通类或抽象类都可以作为接口被实现。
   
     同样使用implements关键字进行实现。
   
     但是dart的接口有点奇怪，如果实现的类是普通类，会将普通类和抽象中的属性的方法全部需要覆写一遍。
     
     而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像Java接口那样的方式，一般会使用抽象类。
   
     建议使用抽象类定义接口。
   
   */
   
   abstract class Db{   //当做接口   接口：就是约定 、规范
       String uri;      //数据库的链接地址
       add(String data);
       save();
       delete();
   }
   
   class Mysql implements Db{
     @override
     String uri;
     Mysql(this.uri);
     @override
     add(data) {
       // TODO: implement add
       print('这是mysql的add方法'+data);
     }
     @override
     delete() {
       // TODO: implement delete
       return null;
     }
     @override
     save() {
       // TODO: implement save
       return null;
     }
     remove(){  
     }  
   }
   ```

### 十二 一个类实现多个接口以及dart中mixins

1. 一个类实现多个接口

``` dart
实现多个接口，需要保证

abstract class A{
  String name;
  printA();
}

abstract class B{
  printB();
}

class C implements A,B{  
  @override
  String name;  
  @override
  printA() {
    print('printA');
  }
  @override
  printB() {
    // TODO: implement printB
    return null;
  }
}
```

2. 一个类继承多个类

   ``` dart
   /*
   mixins的中文意思是混入，就是在类中混入其他功能。
   在Dart中可以使用mixins实现类似多继承的功能
   因为mixins使用的条件，随着Dart版本一直在变，这里讲的是Dart2.x中使用mixins的条件：
     1、作为mixins的类只能继承自Object，不能继承其他类 ,这样做目的，是保证数据唯一，避免数据混乱
     2、作为mixins的类不能有构造函数
     3、一个类可以mixins多个mixins类
     4、mixins绝不是继承，也不是接口，而是一种全新的特性
   */
   class A {
     String info="this is A";
     void printA(){
       print("A");
     }
   }
   class B {
     void printB(){
       print("B");
     }
   }
   class C extends Person with B, A { // AB中如果有重复，A会替换掉B
     C(String name, num age) : super(name, age);
   }
   void main(){  
     var c=new C();  
     c.printA();
     c.printB();
     print(c.info);
   }
   
   ```

   **注意：A和B中重复问题，后面的替换前面的**

3. mixins类型判断

   ``` dart
   /*
   mixins的实例类型是什么？
   很简单，mixins的类型就是其超类的子类型。
   */
     var c=new C();  
     print(c is C);    //true
     print(c is A);    //true
     print(c is B);   //true
   ```

### 十三Dart中的泛型和泛型方法和泛型类

1. 泛型方法

   ``` dart
    getData<T>(T value){
         return value;
    }
   
     print(getData<int>(12));
   ```

2. 泛型类

   ``` dart
   
    class PrintClass<T>{
         List list=new List<T>();
         void add(T value){
             this.list.add(value);
         }
         void printInfo(){          
             for(var i=0;i<this.list.length;i++){
               print(this.list[i]);
             }
         }
    }
   ```

3. 泛型接口

   ``` dart
   abstract class Cache<T> {
     getByKey(String key);
     void setByKey(String key, T value);
   }
   
   class FlieCache<T> implements Cache<T> {
     @override
     getByKey(String key) {
       return null;
     }
   
     @override
     void setByKey(String key, T value) {
       print("我是文件缓存 把key=${key}  value=${value}的数据写入到了文件中");
     }
   }
   
   class MemoryCache<T> implements Cache<T> {
     @override
     getByKey(String key) {
       return null;
     }
   
     @override
     void setByKey(String key, T value) {
       print("我是内存缓存 把key=${key}  value=${value} -写入到了内存中");
     }
   }
   
    MemoryCache m = new MemoryCache<Map>();
    m.setByKey('index', {"name": "张三", "age": 20});
   ```

   ### 十四 dart系统库，三方库，自定义库

   ``` dart
   /*
   
   前面介绍Dart基础知识的时候基本上都是在一个文件里面编写Dart代码的，但实际开发中不可能这么写，模块化很重要，所以这就需要使用到库的概念。
   
   在Dart中，库的使用时通过import关键字引入的。
   
   library指令可以创建一个库，每个Dart文件都是一个库，即使没有使用library指令来指定。
   
   
   Dart中的库主要有三种：
   
       1、我们自定义的库     
             import 'lib/xxx.dart';
       2、系统内置库       
             import 'dart:math';    
             import 'dart:io'; 
             import 'dart:convert';
       3、Pub包管理系统中的库  
           https://pub.dev/packages
           https://pub.flutter-io.cn/packages
           https://pub.dartlang.org/flutter/
           1、需要在自己想项目根目录新建一个pubspec.yaml
           2、在pubspec.yaml文件 然后配置名称 、描述、依赖等信息
           3、然后运行 pub get 获取包下载到本地  
           4、项目中引入库 import 'package:http/http.dart' as http; 看文档使用
   */
   1.自定义库
   2. 系统库  
   // import 'dart:io';
   import "dart:math";
   main(){
       print(min(12,23));
       print(max(12,25));  
   }
   3.第三方库
     Pub包管理系统中的库  
           https://pub.dev/packages
           https://pub.flutter-io.cn/packages
           https://pub.dartlang.org/flutter/
           1、需要在自己想项目根目录新建一个pubspec.yaml
           2、在pubspec.yaml文件 然后配置名称 、描述、依赖等信息
           3、然后运行 pub get 获取包下载到本地  
           4、项目中引入库 import 'package:http/http.dart' as http; 看文档使用
      
   ```

   2. await使用

      ``` dart
      /*
      async和await
        这两个关键字的使用只需要记住两点：
          只有async方法才能使用await关键字调用方法
          如果调用别的async方法必须使用await关键字
      
      async是让方法变成异步。
      await是等待异步方法执行完成。
      */
      
      void main() async{
        var result = await testAsync();
        print(result);
      
      }
      
      //异步方法
      testAsync() async{
        return 'Hello async';
      }
      ```

      3. 导入pub包管理器

         ``` dart
         /*
         pub包管理系统:
         
         
         1、从下面网址找到要用的库
                 https://pub.dev/packages
                 https://pub.flutter-io.cn/packages
                 https://pub.dartlang.org/flutter/
         
         2、创建一个pubspec.yaml文件，内容如下
         
             name: xxx
             description: A new flutter module project.
             dependencies:  
                 http: ^0.12.0+2
                 date_format: ^1.0.6
         
         3、配置dependencies
         
         4、运行pub get 获取远程库
         
         5、看文档引入库使用
         */
         import 'dart:convert' as convert;
         import 'package:http/http.dart' as http;
         import 'package:date_format/date_format.dart';
         
         main() async {
           var url =
               "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
         
           // Await the http get response, then decode the json-formatted responce.
           var response = await http.get(url);
           if (response.statusCode == 200) {
             var jsonResponse = convert.jsonDecode(response.body);
             print(jsonResponse);
           } else {
             print("Request failed with status: ${response.statusCode}.");
           }
           print(formatDate(DateTime(1989, 2, 21), [yyyy, '*', mm, '*', dd]));
         }
         
         ```

      4. 解决国内镜像方案

         ``` dart
         新增两个环境变量——用户变量即可
         PUB_HOSTED_URL ： https://pub.flutter-io.cn
         FLUTTER_STORAGE_BASE_URL ： https://storage.flutter-io.cn
         ```

         ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200402150958217.png)

      5. 重命名 解决包中class文件冲突问题

         ``` dart
         /*
         1、冲突解决
         当引入两个库中有相同名称标识符的时候，如果是java通常我们通过写上完整的包名路径来指定使用的具体标识符，甚至不用import都可以，但是Dart里面是必须import的。当冲突的时候，可以使用as关键字来指定库的前缀。如下例子所示：
         
             import 'package:lib1/lib1.dart';
             import 'package:lib2/lib2.dart' as lib2;
             Element element1 = new Element();           // Uses Element from lib1.
             lib2.Element element2 = new lib2.Element(); // Uses Element from lib2.
         
         */
         import 'lib/Person1.dart';
         import 'lib/Person2.dart' as lib;
         
         main(List<String> args) {
           Person p1=new Person('张三', 20);
           p1.printInfo();
           lib.Person p2=new lib.Person('李四', 20);
           p2.printInfo();
         }
         ```

         ``` dart
         import 'lib/Person3.dart' as p;
         
         main(List<String> args) {
           // var person = Person();
           p.Person.show();
         }
         
         class Person {
           static String name = '张三';
           static void show() {
             print(name);
           }
         }
         ```

   6. 部分导入

      ``` dart
      /*
      部分导入
        如果只需要导入库的一部分，有两种模式：
      
           模式一：只导入需要的部分，使用show关键字，如下例子所示：
      
            import 'package:lib1/lib1.dart' show foo;
      
           模式二：隐藏不需要的部分，使用hide关键字，如下例子所示：
      
            import 'package:lib2/lib2.dart' hide foo;      
      
      */
      ```

      ``` dart
      void getName(){
        print('张三');
      }
      void getAge(){
        print(20);
      }
      void getSex(){
        print('男');
      }
       import 'lib/myMath.dart' hide getName;
      
      void main(){
      //  getName();
        getAge();
      }
      ```

   7 懒加载 减少APP的启动时间。

   ``` dart
   /*
   延迟加载
   
       也称为懒加载，可以在需要的时候再进行加载。
       懒加载的最大好处是可以减少APP的启动时间。
   
       懒加载使用deferred as关键字来指定，如下例子所示：
   
       import 'package:deferred/hello.dart' deferred as hello;
   
       当需要使用的时候，需要使用loadLibrary()方法来加载：
   
       greet() async {
         await hello.loadLibrary();
         hello.printGreeting();
       }
   */
   ```

   