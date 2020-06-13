import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpointclock/src/splash_screem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff3bac68),//Color(0xFF4fc27f), // navigation bar color
      statusBarColor: Color(0xff3bac68), // status bar color
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff4fc27f),
      ),
      home: SplashScreem()
    );
  }
}
