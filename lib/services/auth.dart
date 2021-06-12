import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../config/config_service.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class DataAuthService extends ConfigService {
  Future<bool> getCurrent();
  Future<bool> logOut();
}

class AuthService extends DataAuthService {
  late SharedPreferences prefs;
  
  @override
  Future<bool> getCurrent() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final _refreshToken = prefs.getString('refresh_token');
      final _accessToken = prefs.getString('access_token');
      print('RefreshToken: ${JwtDecoder.getExpirationDate(_refreshToken!)}');
      print('Token: ${JwtDecoder.getExpirationDate(_accessToken!)}');
      if (!JwtDecoder.isExpired(_refreshToken)) {
        if (!JwtDecoder.isExpired(_accessToken)) return true;
      }
      print('TOKEN DEAD');
      return false;
    } catch (e) {
      throw AuthException(message: 'Incorrect data');
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', '');
      prefs.setString('refresh_token', '');
      return true;
    } catch (e) {
      throw AuthException(message: 'Incorrect data');
    }
  }
}
