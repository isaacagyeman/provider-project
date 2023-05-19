import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:providerproject/Constants/constants.dart';

class JokeService with ChangeNotifier {
  Map<String, dynamic> _jokesmap = {};
  bool _error = false;
  String _errorMessage = '';
  Map<String, dynamic> get jokesmap => _jokesmap;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchJoke async {
    final response = await get(Uri.parse(
        'https://api.humorapi.com/jokes/search?api-key=${JokeApiKey}&number=100&keyword=woman'));
    if (response.statusCode == 200) {
      try {
        _jokesmap = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _jokesmap = {};
      }
    } else {
      _error = true;
      _errorMessage =
          'Oops something went wrong check your internet connection ):';
      _jokesmap = {};
    }
    notifyListeners();
  }
}
