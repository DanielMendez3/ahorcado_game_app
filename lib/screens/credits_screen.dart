import 'package:ahorcado_game_app/services/game_service.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        shadowColor: AppColor.primaryColor,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'CRÉDITOS',
          style: GoogleFonts.goldman(textStyle: headline4),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('IDEA ORIGINAL',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                Text('Dev Guy',
                    style: GoogleFonts.goldman(textStyle: headline6)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('VIDEO ORIGINAL',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                GestureDetector(
                  child: Text('Link ',
                      style: GoogleFonts.goldman(
                          textStyle: headline6, fontSize: 22)),
                  onTap: () async {
                    await launch('https://youtu.be/OnOhqy799QE');
                  },
                ),
              ],
            ),
            Divider(
              height: 40,
              color: AppColor.secundaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('API UTILIZADA',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                GestureDetector(
                  child: Text('Sitio Web',
                      style: GoogleFonts.goldman(
                          textStyle: headline6, fontSize: 22)),
                  onTap: () async {
                    await launch(
                        'http://palabras-aleatorias-public-api.herokuapp.com/');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CREADOR',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                Text('Alex P. Scigalszky',
                    style: GoogleFonts.goldman(textStyle: headline6)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EMAIL', style: GoogleFonts.goldman(textStyle: headline6)),
                Text('alexpablo.90@gmail.com',
                    style: GoogleFonts.goldman(
                        textStyle: headline6, fontSize: 18)),
              ],
            ),
            Divider(
              height: 40,
              color: AppColor.secundaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('REPOSITORIO',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                GestureDetector(
                  child: Text('Github Link',
                      style: GoogleFonts.goldman(
                          textStyle: headline6, fontSize: 22)),
                  onTap: () async {
                    await launch(
                        'https://github.com/DanielMendez3/ahorcado_game_app');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CREADOR',
                    style: GoogleFonts.goldman(textStyle: headline6)),
                GestureDetector(
                  child: Text('Daniel Méndez',
                      style: GoogleFonts.goldman(
                          textStyle: headline6, fontSize: 22)),
                  onTap: () async {
                    await launch('https://github.com/DanielMendez3');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
