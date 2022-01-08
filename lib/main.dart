import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/screens/credits_screen.dart';
import 'package:ahorcado_game_app/screens/home_screen.dart';
import 'package:ahorcado_game_app/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/start_screen.dart';

void main() {
  runApp(AppSatte());
}

class AppSatte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(
        create: (_) => GameProvider(''),
      ),
      ChangeNotifierProvider(
        create: (_) => GameService(),
      ),
    ]);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<GameService>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ahorcado',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: 'start_game',
      routes: {
        'start_game': (_) => StartSreen(),
        'home': (_) => HomeScreen(),
        'credits': (_) => CreditScreen()
      },
    );
  }
}
