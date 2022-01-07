import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LetterWidget extends StatelessWidget {
  final String character;
  final bool visible;
  const LetterWidget({Key? key, required this.character, required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gameProvider = Provider.of<GameProvider>(context);
    final countLetters = _gameProvider.word.length;
    print(MediaQuery.of(context).size.width);
    final size = MediaQuery.of(context).size.width * 0.65 / countLetters;
    print(size);
    return Container(
      height: 55,
      width: size,
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
