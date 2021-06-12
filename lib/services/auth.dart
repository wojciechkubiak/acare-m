import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../config/config_service.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class DataAuthService extends ConfigService {
  Future<bool> getCurrent();
  Future<bool> logOut();
  Future<bool> refreshToken({String? token});
}

class AuthService extends DataAuthService {
  late SharedPreferences prefs;

  @override
  Future<bool> getCurrent() async {
    try {
      prefs = await SharedPreferences.getInstance();
      String _refreshToken = prefs.getString('refresh_token') ?? '';
      String _accessToken = prefs.getString('access_token') ?? '';
      if (JwtDecoder.tryDecode(_refreshToken) != null &&
          JwtDecoder.tryDecode(_accessToken) != null) {
        print('RefreshToken: ${JwtDecoder.getExpirationDate(_refreshToken)}');
        print('Token: ${JwtDecoder.getExpirationDate(_accessToken)}');
        if (!JwtDecoder.isExpired(_refreshToken)) {
          if (!JwtDecoder.isExpired(_accessToken)) {
            return true;
          }
          return await this.refreshToken(token: _refreshToken);
        }
      }
      print('TOKEN DEAD');
      return false;
    } catch (e) {
      throw AuthException(message: 'Incorrect data');
    }
  }

  @override
  Future<bool> refreshToken({String? token}) async {
    prefs = await SharedPreferences.getInstance();

    try {
      FormData formData = FormData.fromMap({'refresh': token});
      response = await dio.post("/token/refresh/", data: formData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        RefreshToken refreshToken = RefreshToken.fromJson(response.data);
        prefs.setString('access_token', refreshToken.access!);
        if (!JwtDecoder.isExpired(refreshToken.access!)) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw AuthException(message: e);
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
