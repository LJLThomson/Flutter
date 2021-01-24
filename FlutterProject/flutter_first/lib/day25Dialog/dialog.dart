import 'package:flutter/material.dart';
import 'package:flutter_first/day25Dialog/DialogDemo.dart';
import 'SimpleDialogDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),
      initialRoute: '/dialogDemo',
      routes: {
        '/dialog': (context) => SimpleDialogDemo(),
        '/dialogDemo':(context) => DialogDemo(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.blue),
    );
  }
}
