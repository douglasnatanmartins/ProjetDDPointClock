import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpointclock/widgets/logins_widgets/custom_shepe_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreem extends StatefulWidget {

  @override
  _LoginScreemState createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreem> {

  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500],
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0, 2.0))
                      ]),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 11.5,
                      ),
                      Text(
                        "BienVenido a Clock Point!",
                        style: GoogleFonts.amaranth(
                            color: Colors.white, fontSize: 25),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 130, left: 12, right: 12),
                  child: Row(
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.amaranth(
                            color: Colors.white, fontSize: 55),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 280,
                      ),
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            "Registrar",
                            style: GoogleFonts.amaranth(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500],
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 0.0))
                            ]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12, left: 8, right: 8,),
                          child: Column(
                            children: [
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width / 0.5,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 4, top: 4, right: 5),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.alternate_email,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          labelText: "Correo",
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width / 0.5,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 4, top: 4, right: 5),
                                    child: TextFormField(
                                      obscureText: _obscure,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              _obscure = !_obscure;
                                            });
                                          },
                                          icon: Icon(!_obscure ? Icons.visibility : Icons.visibility_off),
                                        ),
                                          icon: Icon(
                                            Icons.lock,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          labelText: "Contraseña",
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
