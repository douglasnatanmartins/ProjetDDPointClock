import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterpointclock/src/screns_logins/login_screem.dart';
import 'package:flutterpointclock/src/splash_screem.dart';
import 'package:i18n_extension/i18n_widget.dart';

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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es', 'PY'),
          const Locale('pt', "BR"),
          const Locale('en', "US"),
        ],
      theme: ThemeData(
        primaryColor:  Color(0xff4fc27f),
        accentColor: Colors.white,
        bottomAppBarColor: Colors.white,
        buttonColor: Color(0xff4fc27f),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: I18n(
        initialLocale: Locale("pt", "BR"),
        child: LoginScreem()
      )
    );
  }
}
