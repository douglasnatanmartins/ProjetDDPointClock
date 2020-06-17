import 'dart:async';

import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class HomeScreem extends StatefulWidget {

  bool isStartRecebido;

  HomeScreem({this.isStartRecebido});

  @override
  _HomeScreemState createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {

  bool _isStart = true;
  String _contador = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed(){
    if(_stopWatch.isRunning){
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText(){
    _contador = _stopWatch.elapsed.inHours.toString().padLeft(2,'0') + ':'+
        (_stopWatch.elapsed.inMinutes%60).toString().padLeft(2,'0') + ':' +
        (_stopWatch.elapsed.inSeconds%60).toString().padLeft(2,'0');
  }



  String dia(int day) {
    switch (day) {
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

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  var _data = new DateTime.now();

  String _timeString;


  @override
  void initState() {
    super.initState();
    _isStart = widget.isStartRecebido;
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 58,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 2.0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "${dia(_data.weekday)}, ${formatDate(_data, [
                      d,
                      " ",
                      M,
                      " ",
                      yyyy,
                    ])}",
                    style: GoogleFonts.amaranth(
                      color: Colors.grey[100],
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height - 255,
                color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Icon(_isStart ? Icons.play_arrow : Icons.stop),
                      onPressed: _startStopButtonPressed,
                    ),
                    RaisedButton(
                      child: Text('Reset'),
                      onPressed: _resetButtonPressed,
                    ),
                  ],
                ),
              ),
                ),
            Divider(),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width-290,),
                Text(
                  "Horario Actual",
                  style: GoogleFonts.amaranth(
                      fontSize: 23,
                      color: Colors.grey[400].withAlpha(100)
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 0, left: 8, right: 8),
                child: Row(
                  children: [
                    /*Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Trab. en el día:",
                              style: GoogleFonts.delius(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(_contador,
                                  style: TextStyle(fontSize: 12)),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Saldo del día:",
                              style: GoogleFonts.delius(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text("00:00:00",
                                  style: TextStyle(fontSize: 12)),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Saldo total:",
                              style: GoogleFonts.delius(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child:CountdownFormatted(
                                duration: Duration(hours: 8),
                                builder: (BuildContext ctx, String remaining) {
                                  return Text(remaining); // 01:00:00
                                },
                              )
                            )
                          ],
                        )
                      ],
                    ),*/
                    SizedBox(width: MediaQuery.of(context).size.width - 280),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              _timeString,
                              style: GoogleFonts.amaranth(
                                  color: Colors.grey[600], fontSize: 28),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
