import 'package:flutter/material.dart';
import 'package:flutterpointclock/src/screens_home/home_screem.dart';
import 'package:flutterpointclock/widgets/DrawerWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Dia",
              style: GoogleFonts.amaranth(
                color: Colors.white,
                fontSize: 28
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 3,
            mini: false,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.fingerprint, color: Colors.white),
            onPressed: (){
                showDialog(context: context,
                builder: (context) => HomeDialog()
                );
            },
          ),
          drawer: DrawerWidget(_pageController),
          body: HomeScreem()
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Semana",
              style: GoogleFonts.amaranth(
                  color: Colors.white,
                  fontSize: 28
              ),
            ),
          ),
          drawer: DrawerWidget(_pageController),
          body: Container(color: Colors.blue),
        ),
        Container(color: Colors.green),
        Container(color: Colors.purple),
        Container(color: Colors.orange),
        Container(color: Colors.brown),
        Container(color: Colors.lime),
        Container(color: Colors.lightBlue),
        Container(color: Colors.black),
        Container(color: Colors.red),
        Container(color: Colors.white),
        Container(color: Colors.indigoAccent),
      ],
    );
  }
}
