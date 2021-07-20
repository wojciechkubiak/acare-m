import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config_service.dart';

abstract class DataHomeService extends ConfigService {}

class HomeService extends DataHomeService {}
