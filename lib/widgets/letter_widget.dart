import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LetterWidget extends StatelessWidget {
  final String character;
  final bool visible;
  const LetterWidget({Key? key, required this.character, required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 45,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: AppColor.primaryColorDark,
          borderRadius: BorderRadius.circular(4.0)),
      child: Visibility(
        visible: this.visible,
        child: Center(
          child: Text(this.character,
              style: GoogleFonts.goldman(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
        ),
      ),
    );
  }
}
