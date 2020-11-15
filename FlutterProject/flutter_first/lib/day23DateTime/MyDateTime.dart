import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      //配置如下两个国际化的参数
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // supportedLocales: [
      //   //此处
      //   const Locale('zh', 'CH'),
      //   const Locale('en', 'US'),
      // ],
      home: Scaffold(
        //标题栏
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        //内容区域
        body: DatePickerPubPage(),
      ),
      //主题
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class DatePickerPubPage extends StatefulWidget {
  @override
  _DatePickerPubPageState createState() => _DatePickerPubPageState();
}

class _DatePickerPubPageState extends State<DatePickerPubPage> {
  DateTime _selectedDateTime = DateTime.now(); //获取当前日期

  var nowTime = DateTime.now(); //获取当前时间

  DateTime _selectedDate = DateTime.now(); //当前选中的日期
  TimeOfDay _selectedTime = TimeOfDay.now(); //当前选中的时间

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(nowTime); //2020-02-11 08:51:14.165032

    //当前时间转换为时间戳
    var a = nowTime.millisecondsSinceEpoch; //13位时间戳
    print(a); //1581382274165

    //将时间戳转换成时间
    var aTime = DateTime.fromMillisecondsSinceEpoch(a);
    print(aTime); //2020-02-11 08:51:14.165

    //Flutter的第三方库 date_format 的使用
    //2020-02-11 08:51:14.165 时间转换为  2020-02-11

    print(formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]));

    //2020-02-11 08:51:14.165 时间转换为 2020年02月11日
    print(formatDate(DateTime.now(), [yyyy, "年", mm, "月", dd, "日"]));
  }

  //调起日期选择器
  void _showDatePicker() {
    //获取异步方法里面的值的第一种方式：then
    showDatePicker(
      //如下四个参数为必填参数
      context: context,
      initialDate: _selectedDate, //选中的日期
      firstDate: DateTime(1980), //日期选择器上可选择的最早日期
      lastDate: DateTime(2100), //日期选择器上可选择的最晚日期
      // locale:Locale("zh")
    ).then((selectedValue) {
      setState(() {
        //将选中的值传递出来
        this._selectedDate = selectedValue;
      });
    }).catchError((err) {
      print(err);
    });
  }

  //调起时间选择器
  void _showTimePicker() async {
    // 获取异步方法里面的值的第二种方式：async+await
    //await的作用是等待异步方法showDatePicker执行完毕之后获取返回值
    var result = await showTimePicker(
      context: context,
      initialTime: _selectedTime, //选中的时间
    );

    //将选中的值传递出来
    setState(() {
      this._selectedTime = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //可以通过在外面包裹一层InkWell来让某组件可以响应用户事件
            InkWell(
              onTap: () {
                //调起日期选择器
                _showDatePicker();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(formatDate(
                      this._selectedDate, [yyyy, "-", mm, "-", "dd"])),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),

            InkWell(
              onTap: () {
                //调起时间选择器
                _showTimePicker();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${this._selectedTime.format(context)}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}