## TextField单行文本框 多行文本框 CheckBox CheckboxListTile

Flutter 中常见的表单有 TextField 单行文本框，TextField 多行文本框、CheckBox、Radio、Switch CheckboxListTile、RadioListTile、SwitchListTile、Slide.

### 1.TextFiled文本框

![image-20201113000059895](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201113000059895.png)

``` dart
import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  TextFieldDemoPage({Key key}) : super(key: key);

  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  var _username = new TextEditingController(text:"初始值"); //初始化的时候给表单赋值
  var _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text='初始值';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单演示页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        // child:TextDemo() ,    
        child:Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名"
              ),
              controller: _username,
              onChanged: (value){
                 setState(() {
                    _username.text=value; 
                 });
              },
              
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "密码"
              ),             
              onChanged: (value){
                 setState(() {
                    this._password=value; 
                 });
              },
              
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text("登录"),
                onPressed: (){
                  print(this._username.text);
                  print(this._password);
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ) ,     
      )
    );
  }
}


class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            TextField(),
            SizedBox(height: 20),
            TextField(
              decoration:InputDecoration(
                hintText:"请输入搜索的内容",
                border: OutlineInputBorder()
              ) ,
            ),
             SizedBox(height: 20),
             TextField(
              maxLines: 4,
              decoration:InputDecoration(
                hintText:"多行文本框",
                border: OutlineInputBorder()
              ) ,
            ),
             SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration:InputDecoration(
                hintText:"密码框",
                border: OutlineInputBorder()
              ) ,
            ),
             SizedBox(height: 20),

            TextField(             
              decoration:InputDecoration(               
                border: OutlineInputBorder(),
                labelText: "用户名"
              ) 
              
            ),
             SizedBox(height: 20),
            TextField(    
              obscureText: true,         
              decoration:InputDecoration(               
                border: OutlineInputBorder(),
                labelText: "密码",
                // labelStyle: TextStyle()
              ) 
              
            ),
             SizedBox(height: 20),
             TextField(                   
              decoration:InputDecoration(               
               icon: Icon(Icons.people),
               hintText: "请输入用户名"
              )               
            ),
          ],
      ),
    );  
  }
}
```

### 2.TextField其他重要属性

``` dart
 const TextField({
    Key key,
    this.controller,    //编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
    this.focusNode,  //用于管理焦点
    this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观
    TextInputType keyboardType,   //设置输入类型，不同的输入类型键盘不一样
    this.textInputAction,   //用于控制键盘动作（一般位于右下角，默认是完成）
    this.textCapitalization = TextCapitalization.none,
    this.style,    //输入的文本样式
    this.textAlign = TextAlign.start,   //输入的文本位置
    this.textDirection,    //输入的文字排列方向，一般不会修改这个属性
    this.autofocus = false,   //是否自动获取焦点
    this.obscureText = false,   //是否隐藏输入的文字，一般用在密码输入框中
    this.autocorrect = true,   //是否自动校验
    this.maxLines = 1,   //最大行
    this.maxLength,   //能输入的最大字符个数
    this.maxLengthEnforced = true,  //配合maxLength一起使用，在达到最大长度时是否阻止输入
    this.onChanged,  //输入文本发生变化时的回调
    this.onEditingComplete,   //点击键盘完成按钮时触发的回调，该回调没有参数，(){}
    this.onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
    this.inputFormatters,   //对输入文本的校验
    this.enabled,    //输入框是否可用
    this.cursorWidth = 2.0,  //光标的宽度
    this.cursorRadius,  //光标的圆角
    this.cursorColor,  //光标的颜色
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.down,
    this.enableInteractiveSelection,
    this.onTap,    //点击输入框时的回调(){}
    this.buildCounter,
  })
```

keyboardType ——————键盘输入类型(除了隐藏密码不能做到)

```
keyboardType: TextInputType.visiblePassword, 显示密码
```

obscureText——————密码和普通文本框

textAlign ——————文字对齐方式

maxLines ——————多行

maxLength——————最多多少文字

onChanged ——————文字改变时回调

onEditingComplete ————点击键盘按钮确认时触发

onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String)

textInputAction ————修改键盘右小角按钮文字或图标（textInputAction: TextInputAction.go,）

``` dart
TextField(
	onSubmitted: (value){
		print("onSubmitted 点击了键盘的确定按钮，输出的信息是：${value}");
	},
	onEditingComplete: (){
		print("onEditingComplete 点击了键盘的确定按钮");
	},
	onChanged: (value){
		print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
	},
	decoration: InputDecoration(
		hintText: "这是实现自己的 onChanged 的监听",
	),
),
```

![image-20201113001658242](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201113001658242.png)

————https://blog.csdn.net/xcf111/article/details/92778105?biz_id=102&utm_term=TextEditingController&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-0-92778105&spm=1018.2118.3001.4449

有无边框 以及图标

``` dart
TextField(
	decoration: InputDecoration(
		hintText: " InputDecoration 有边框",
	),
),
TextField(
	decoration: InputDecoration.collapsed(
		hintText: " InputDecoration.collapsed 无边框",
	),
),
TextField(
	decoration: InputDecoration(
		icon: Icon(Icons.phone),
		hintText: "icon",
	),
),
TextField(
	decoration: InputDecoration(
		prefixIcon: Icon(Icons.phone),
		hintText: "prefixIcon",
	),
),
TextField(
	decoration: InputDecoration(
		suffixIcon: Icon(Icons.phone),
		hintText: "suffixIcon",
	),
),
```

2. ## 边框border

   ``` dart
   TextField(
   	decoration: InputDecoration(
   		hintText: "InputBorder.none",
   		border: InputBorder.none
   	),
   ),
   TextField(
   	decoration: InputDecoration(
   		border: UnderlineInputBorder(),
   		hintText: "UnderlineInputBorder()"
   	),
   ),
   SizedBox(height: 10,),
   TextField(
   	decoration: InputDecoration(
   		border: OutlineInputBorder(),
   		hintText: "OutlineInputBorder()"
   	),
   ),
   ```

3. 键盘

   ``` dart
   TextField(
   	decoration: InputDecoration(
   		hintText: "键盘类型：TextInputType",
   	),
   	keyboardType: TextInputType.emailAddress,
   ),
   TextField(
   	decoration: InputDecoration(
   		hintText: "键盘左下角键：textInputAction",
   	),
   	textInputAction: TextInputAction.go,
   ),
   ```

4. 光标样式

   ``` dart
   TextField(
   	cursorColor: Colors.yellow,
   	cursorWidth: 20,
   	cursorRadius: Radius.circular(5),
   ),
   ```

5. 光标位置

   ``` dart
   TextField(
   　　　　　　　　　　//输入键盘类型
                 keyboardType: TextInputType.text,
                 autofocus: true,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(),
                       borderSide: BorderSide.none),
                 ),
                 onChanged: (value) {
                   this._keyword = value;
                 },
                 controller: TextEditingController.fromValue(TextEditingValue(
                     text: '${this._keyword == null ? "" : this._keyword}',  //判断keyword是否为空
                     // 保持光标在最后
                     selection: TextSelection.fromPosition(TextPosition(
                         affinity: TextAffinity.downstream,
                         offset: '${this._keyword}'.length)))),
               ),
   ```

### 3.Checkbox、CheckboxListTile多选框组件

1. CheckBox

   ![image-20201113003514131](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201113003514131.png)

   ``` dart
   import 'package:flutter/material.dart';
   
   class CheckBoxDemo extends StatefulWidget {
     CheckBoxDemo({Key key}) : super(key: key);
   
     _CheckBoxDemoState createState() => _CheckBoxDemoState();
   }
   
   class _CheckBoxDemoState extends State<CheckBoxDemo> {
   
     var flag=true;
     
     @override
     Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
             title: Text("checkbox"),
           ),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
   
               Row(children: <Widget>[
                 Checkbox(
                   value: this.flag,
                   onChanged: (v){
                     setState(() {
                        this.flag=v;
                     });
                   },
                   activeColor: Colors.red,
                 )
               ]),
               Row(
                 children: <Widget>[
                   Text(this.flag?"选中":"未选中")
                 ],
               ),
               SizedBox(height: 40),
   
               // CheckboxListTile(
               //    value: this.flag,
               //     onChanged: (v){
               //       setState(() {
               //          this.flag=v;
               //       });
               //     },
               //     title: Text("标题"),
               //     subtitle:Text("这是二级标题") ,
               // ),
               Divider(),
               CheckboxListTile(
                  value: this.flag,
                   onChanged: (v){
                     setState(() {
                        this.flag=v;
                     });
                   },
                   title: Text("标题"),
                   subtitle:Text("这是二级标题") ,
                   secondary:Icon(Icons.help)
               )
   
             ],
           ),
         
       );
     }
   }
   
   ```

2. checkBoxListTitle

   ![image-20201113003647527](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201113003647527.png)

### 4.Radio、RadioListTile **单选按钮组件**

![image-20201113003726755](C:\Users\jialiang.li\AppData\Roaming\Typora\typora-user-images\image-20201113003726755.png)

——————下一章节讲