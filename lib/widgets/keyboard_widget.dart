import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KeyBoardWidget extends StatelessWidget {
  const KeyBoardWidget({Key? key}) : super(key: key);
  static List<String> alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    final _gameProvider = Provider.of<GameProvider>(context);
    return GridView.count(
        crossAxisCount: 6,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.8,
        padding: EdgeInsets.all(8.0),
        children: alphabet
            .map((e) => RawMaterialButton(
                child: Text(e,
                    style: GoogleFonts.goldman(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                fillColor: _gameProvider.selectedChars.contains(e)
                    ? Colors.black26
                    : AppColor.secundaryColor,
                onPressed: _gameProvider.selectedChars.contains(e)
                    ? null
                    : () {
                        _gameProvider.selectedChar(e);
                        print(_gameProvider.selectedChars);
                        if (!_gameProvider.word.split('').contains(e)) {
                          _gameProvider.tries++;
                        }
                        //Logica de juego
                      }))
            .toList());
  }
}
