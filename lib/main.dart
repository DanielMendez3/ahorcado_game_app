import 'package:ahorcado_game_app/providers/game_provider.dart';
import 'package:ahorcado_game_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppSatte());
}

class AppSatte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(create: (_) => GameProvider()),
    ]);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ahorcado',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
