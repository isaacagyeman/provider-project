import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:providerproject/Constants/constants.dart';

class IPTrackService extends ChangeNotifier {
  Map<String, dynamic> _ipMap = {};
  bool _error = false;
  String _errorMessage = '';
  Map<String, dynamic> get ipMap => _ipMap;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> fetchIp(String ipAddress) async {
    final response = await get(Uri.parse(
        'https://geo.ipify.org/api/v2/country?apiKey=${Geoip_ApikEY}&ipAddress=${ipAddress}'));
    if (response.statusCode == 200) {
      try {
        _ipMap = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _ipMap = {};
      }
    } else {
      _error = true;
      _errorMessage =
          'Oops something went wrong check your internet connection ):';
      _ipMap = {};
    }
    notifyListeners();
  }
}
