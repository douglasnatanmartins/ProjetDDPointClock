import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpointclock/src/screens_home/home_screem.dart';
import 'package:flutterpointclock/widgets/DrawerWidget.dart';
import 'package:flutterpointclock/widgets/dialogs/home_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  String dia(int day){
    switch(day){
      case 1:
        return "lun";
        break;
      case 2:
        return "mar";
        break;
      case 3:
        return "mie";
        break;
      case 4:
        return "jue";
        break;
      case 5:
        return "vie";
        break;
      case 6:
        return "sab";
        break;
      case 7:
        return "dom";
        break;
    }
    return dia(_data.weekday);
  }

  var _data = new DateTime.now();

  bool isStratRecebidoDialog = false;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            title: Text(
              "Dia",
              style: GoogleFonts.amaranth(
                color: Colors.white,
                fontSize: 28
              ),
            ),
          ),
         floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: FloatingActionButton(
            elevation: 3,
            mini: false,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.fingerprint, color: Colors.white),
            onPressed: (){
                showDialog(context: context,
                builder: (context) => HomeDialog());
            },
          ),
          drawer: DrawerWidget(_pageController),
          body:  HomeScreem(
            isStartRecebido: isStratRecebidoDialog,
          )
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
