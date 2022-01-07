import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier {
  String _word = 'CERDO'.toUpperCase();
  int tries = 0;
  List<String> _selectedChars = [];
  List<String> get selectedChars => _selectedChars;

  String get word => _word;
  set word(String value) {
    _word = value;
    _selectedChars = [];
    tries = 0;
    notifyListeners();
  }

  void selectedChar(String e) {
    _selectedChars.add(e);
    notifyListeners();
  }

  GameProvider() {
    _selectedChars = [];
  }
}
