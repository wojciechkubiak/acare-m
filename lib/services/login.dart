import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../config/config_service.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class DataLoginService extends ConfigService {}

class LoginService extends DataLoginService {}
