import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/services/game_service.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final _gameService = Provider.of<GameService>(context);
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
                    : () async {
                        _gameProvider.selectedChar(e);
                        if (!_gameProvider.word.split('').contains(e)) {
                          _gameProvider.tries++;
                        } else {
                          _gameProvider.verificar![e] = true;
                        }

                        //Validamos si se completó la palabra
                        int contador = 0;
                        _gameProvider.verificar!.forEach((key, encontrada) {
                          if (!encontrada) {
                            contador++;
                          }
                        });

                        if (contador == 0) {
                          showDialog(context, 'assets/you_win.png');
                          final word = await _gameService.getWord();
                          _gameProvider.word = word.toUpperCase();
                        }

                        if (_gameProvider.tries >= 6) {
                          SystemSound.play(SystemSoundType.click);
                          showDialog(context, 'assets/you_lose.png');
                          final word = await _gameService.getWord();
                          _gameProvider.word = word.toUpperCase();
                        }

                        //Logica de juego
                      }))
            .toList());
  }
}

void showDialog(BuildContext context, String path) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: Duration(milliseconds: 400),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 300,
          child: SizedBox.expand(child: dialogContent(path)),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        //opacity: anim,
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

Widget dialogContent(String path) {
  return Image.asset(path, width: 200, height: 200);
}
