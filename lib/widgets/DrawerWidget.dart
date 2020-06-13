import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/APPS/flutter_point_clock/lib/tile/drawer_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  final PageController pageController;

  DrawerWidget(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "images/fundo1_verde.jpg"), //AssetImage("images/fundo_branco.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    /*  Positioned(
                      left: 15,
                      top: 20,
                      child: Text(
                        "Clock Point",
                        style: GoogleFonts.amaranth(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),*/
                    Positioned(
                      left: 15,
                      top: 40,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("images/boy.jpg"),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 30,
                      child: Text(
                        "Ola, Douglas",
                        style: GoogleFonts.amaranth(
                          color: Color(0xff023119),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 12,
                      child: Text(
                        "douglas.natan@datapar.com.py",
                        style: GoogleFonts.amaranth(
                          color: Color(0xff023119),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(left: 16, top: 10),
               child: Column(
                 children: [
                   DrawerTile(Icons.calendar_today, "Dia", pageController, 0),
                   DrawerTile(Icons.event, "Semana", pageController, 1),
                   DrawerTile(Icons.event_note, "Mes", pageController, 2),
                   DrawerTile(Icons.add_to_photos, "Todos", pageController, 3),
                   DrawerTile(Icons.equalizer, "Informaciones", pageController, 4),
                   DrawerTile(Icons.fingerprint, "Consistencias", pageController, 5),
                   DrawerTile(Icons.sim_card, "Extracto", pageController, 6),
                   DrawerTile(Icons.backup, "Backup", pageController, 7),
                   Divider(),
                   DrawerTile(Icons.settings, "Configuraciones", pageController, 8),
                   DrawerTile(Icons.help, "Ayuda", pageController, 9),
                   DrawerTile(Icons.info, "Acerca del App", pageController, 10),
                   DrawerTile(Icons.exit_to_app, "Salir", pageController, 11),
                 ],
               ),
             )
            ],
          )
        ],
      ),
    );
  }
}

