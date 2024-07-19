// ignore_for_file: unused_field

// Dart imports:
import 'dart:convert';

// Package imports:

import 'package:get_storage/get_storage.dart';
import 'package:examplearch/app/data/model/user/login.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Future setLoginResponse(LoginResponse? data);
  LoginResponse? get loginResponse;
  Future<void> clear();
  Future setLanguageCode(String language);
  String? get languageCode;
  Future setOnBoarded(bool value);
  bool get onBoarded;
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@Order(-1000)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final GetStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    _getStorage.erase();
    return;
  }

  @override
  LoginResponse? get loginResponse {
    String? data = _getStorage.read("loginResponse");
    if (data != null) {
      Map<String, dynamic> json = jsonDecode(data);
      return LoginResponse.fromJson(json);
    }
    return null;
  }

  @override
  Future setLoginResponse(LoginResponse? data) async {
    return await _getStorage.write(
        "loginResponse", data == null ? null : jsonEncode(data.toJson()));
  }

  @override
  String? get languageCode => _getStorage.read("language");

  @override
  Future setLanguageCode(String language) async {
    return await _getStorage.write("language", language);
  }

  @override
  bool get onBoarded => _getStorage.read("onBoarded") ?? false;

  @override
  Future setOnBoarded(bool value) {
    return _getStorage.write("onBoarded", value);
  }
}

@Environment(Environment.test)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceMock implements LocalDataSource {
  @override
  Future<void> clear() async {
    return;
  }

  @override
  LoginResponse? get loginResponse => _loginResponse;

  LoginResponse? _loginResponse;
  @override
  Future setLoginResponse(LoginResponse? data) async {
    _loginResponse = data;
    return;
  }

  @override
  String? get languageCode => "en";

  String? _languageCode;

  @override
  Future setLanguageCode(String language) async {
    _languageCode = language;
    return;
  }

  @override
  bool get onBoarded => true;

  @override
  Future setOnBoarded(bool value) {
    return Future.value(true);
  }
}
