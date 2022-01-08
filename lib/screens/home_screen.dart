import 'package:ahorcado_game_app/widgets/keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:ahorcado_game_app/widgets/figure_widget.dart';
import 'package:ahorcado_game_app/widgets/letter_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    final _gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        shadowColor: AppColor.primaryColor,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'HANGMAN GAME',
          style: GoogleFonts.goldman(textStyle: headline4),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildFigure(_gameProvider),
                _buildLetters(_gameProvider),
                SizedBox(
                  width: double.infinity,
                  height: 350.0,
                  child: KeyBoardWidget(),
                ),
                SizedBox(height: 10),
                RawMaterialButton(
                    padding: EdgeInsets.all(13),
                    child: Text('NUEVA PALABRA',
                        style: GoogleFonts.goldman(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    onPressed: () {
                      _gameProvider.word = 'LOBO';
                    }),
                SizedBox(height: 20)
              ]),
        ),
      ),
    );
  }

  Row _buildLetters(GameProvider _gameProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _gameProvider.word
          .split('')
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: LetterWidget(
                    character: e,
                    visible: _gameProvider.selectedChars.contains(e)),
              ))
          .toList(),
    );
  }

  Widget _buildFigure(GameProvider _gameProvider) {
    return Center(
      child: Stack(
        children: [
          FigureWidget(
              visible: _gameProvider.tries >= 0, path: 'assets/hang.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 1, path: 'assets/head.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 2, path: 'assets/body.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 3, path: 'assets/ra.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 4, path: 'assets/la.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 5, path: 'assets/rl.png'),
          FigureWidget(
              visible: _gameProvider.tries >= 6, path: 'assets/ll.png'),
        ],
      ),
    );
  }
}
