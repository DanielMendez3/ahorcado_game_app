import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier {
  String _word = 'ARBOL'.toUpperCase();
  Map<String, bool>? verificar;
  int tries = 0;
  List<String> _selectedChars = [];
  List<String> get selectedChars => _selectedChars;

  String get word => _word;
  set word(String value) {
    _word = value;
    _selectedChars = [];
    tries = 0;
    verificar = new Map();
    _word.split('').forEach((e) => verificar![e] = false);
    notifyListeners();
  }

  void selectedChar(String e) {
    _selectedChars.add(e);
    notifyListeners();
  }

  GameProvider(String word) {
    _word = word;
    verificar = new Map();
    _word.split('').forEach((e) => verificar![e] = false);
    _selectedChars = [];
  }
}
