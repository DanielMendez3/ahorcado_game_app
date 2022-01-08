import 'package:ahorcado_game_app/models/get_word_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GameService extends ChangeNotifier {
  final String _baseUrl = 'palabras-aleatorias-public-api.herokuapp.com';
  GetWordModelResponse? result;
  String word = '';
  GameService() {
    this.getWord();
  }

  Future<String> getWord() async {
    final url = Uri.https(_baseUrl, '/random');

    final resp = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json, text/plain"
      },
    );

    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    this.result = GetWordModelResponse.fromMap(decodeResp);
    this.word = result!.body.word;
    print(word);
    notifyListeners();
    return result!.body.word;
  }
}
