import 'package:flutter/foundation.dart';

class AppInfo {
  static const bool testMode = kDebugMode;

  //TODO: SYNC WITH pubspec.yml . update version code every release.
  static const versionCode = 01;

  AppInfo._();

  static final _EndPoints api = _EndPoints.instance();
}

class _EndPoints {
  _EndPoints.instance();
  final String baseUrl = "http://127.0.0.1:8000/";
}
