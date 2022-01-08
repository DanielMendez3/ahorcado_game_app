import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class StartSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return Scaffold(
      backgroundColor: AppColor.secundaryColor,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'HANGMAN GAME',
            style: GoogleFonts.goldman(textStyle: headline4),
          ),
          elevation: 0,
          backgroundColor: AppColor.secundaryColor),
      body: SpinPerfect(animate: true, child: BodyScreen()),
    );
  }
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(13),
          fillColor: AppColor.primaryColor,
          child: Text('INICIAR PARTIDA',
              style: GoogleFonts.goldman(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          }),
    );
  }
}
