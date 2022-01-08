import 'package:ahorcado_game_app/services/game_service.dart';
import 'package:ahorcado_game_app/widgets/keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/utils/app_color.dart';
import 'package:ahorcado_game_app/widgets/figure_widget.dart';
import 'package:ahorcado_game_app/widgets/letter_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _gameService = Provider.of<GameService>(context);
    return ChangeNotifierProvider(
        create: (_) => GameProvider(_gameService.word.toUpperCase()),
        child: BuildBody());
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    final gameService = Provider.of<GameService>(context);
    final gameProvider = Provider.of<GameProvider>(context);
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
                _buildFigure(gameProvider),
                FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(child: _buildLetters(gameProvider))),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: FadeIn(
                      duration: const Duration(milliseconds: 1000),
                      child: KeyBoardWidget()),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewWordButton(
                        gameService: gameService, gameProvider: gameProvider),
                    Pulse(
                      infinite: true,
                      child: IconButton(
                          onPressed: () {
                            gameProvider.word.split('').forEach((e) {
                              gameProvider.selectedChar(e);
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ExitButton(),
                SizedBox(height: 20),
                CreditsButton(),
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
      child: BounceInDown(
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
      ),
    );
  }
}

class NewWordButton extends StatelessWidget {
  const NewWordButton({
    Key? key,
    required this.gameService,
    required this.gameProvider,
  }) : super(key: key);

  final GameService gameService;
  final GameProvider gameProvider;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: AppColor.primaryColor,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.all(13),
        child: Text('NUEVA PALABRA',
            style: GoogleFonts.goldman(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        onPressed: () async {
          final word = await gameService.getWord();
          gameProvider.word = word.toUpperCase();
        });
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: AppColor.secundaryColor,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.all(13),
        child: Text('SALIR DEL JUEGO',
            style: GoogleFonts.goldman(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        onPressed: () async {
          Navigator.pushReplacementNamed(context, 'start_game');
        });
  }
}

class CreditsButton extends StatelessWidget {
  const CreditsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: AppColor.secundaryColor,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.all(13),
        child: Text('CRÉDITOS',
            style: GoogleFonts.goldman(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        onPressed: () async {
          Navigator.pushNamed(context, 'credits');
        });
  }
}
