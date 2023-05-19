import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:providerproject/Constants/constants.dart';

class FoodService with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=${FoodApiKey}&number=100'));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        // print(_map);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'This error could be your internet connection';
      _map = {};
    }
      notifyListeners();
  }

  void initialize() {
    _map = {};
    _error = false;
    _errorMessage = '';
  }
}
