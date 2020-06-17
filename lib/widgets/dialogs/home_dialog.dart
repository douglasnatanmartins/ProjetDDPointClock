import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpointclock/src/home_page.dart';
import 'package:flutterpointclock/src/screens_home/home_screem.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeDialog extends StatefulWidget {


  @override
  _HomeDialogState createState() => _HomeDialogState();
}

class _HomeDialogState extends State<HomeDialog> {


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
  bool iconSelected = false;
  bool iconSlected2 = false;
  bool isStartEnviado = false;

  @override
  void initState() {
    super.initState();
    isStartEnviado = false;
    iconSelected = false;
    iconSlected2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Marcar punto",
                  style: GoogleFonts.amaranth(
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${dia(_data.weekday)
                  }, ${formatDate(_data, [d, " ", M, " " , yyyy,])}",
                  style: GoogleFonts.amaranth(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 12, top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width -250,
                height: 90,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: _data,
                  onDateTimeChanged: (DateTime newDateTime){
                  },
                ),
              ),
            ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        iconSelected = !iconSelected;
                      });
                    },
                    child: Icon(!iconSelected ? Icons.check_box_outline_blank: Icons.check_box,
                      color: !iconSelected? Colors.grey : Theme.of(context).primaryColor),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Del dia siguiente (proximo dia)",
                    style: GoogleFonts.amaranth(
                      color: Colors.grey[700],
                      fontSize: 14
                    ),
                  )
                ],
              ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      iconSlected2 = !iconSlected2;
                    });
                  },
                  child: Icon(!iconSlected2 ? Icons.check_box_outline_blank: Icons.check_box,
                      color: !iconSlected2? Colors.grey : Theme.of(context).primaryColor),
                ),
                SizedBox(width: 10,),
                Text(
                  "Añadir image en adelante",
                  style: GoogleFonts.amaranth(
                      color: Colors.grey[700],
                      fontSize: 14
                  ),
                )
              ],
            ),
            SizedBox(height: 8,),
            Container(
              padding: EdgeInsets.only(right: 25),
              child: Divider(),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      "Cancelar",
                      style: GoogleFonts.acme(
                          color: Theme.of(context).primaryColor,
                        fontSize: 18
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                    },
                    child: Text(
                      "Registrar",
                      style: GoogleFonts.acme(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

