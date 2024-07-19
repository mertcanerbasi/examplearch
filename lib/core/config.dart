// Package imports:
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:examplearch/app/data/model/app_remote_config/app_remote_config.dart';
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get name;
  AppRemoteConfig get remoteConfig;
}

@Environment(Environment.prod)
@Order(-999)
@Singleton(as: AppConfig)
class ProdAppConfigImpl extends AppConfig {
  final FirebaseRemoteConfig _config;
  ProdAppConfigImpl(this._config);
  @override
  String get baseUrl => "https://teamdefinex-mobile-auth-casestudy.vercel.app";
  @override
  String get name => "DefineX";

  @override
  AppRemoteConfig get remoteConfig {
    return AppRemoteConfig.fromJson(
        jsonDecode(_config.getValue("prod_config").asString()));
  }
}

@Environment(Environment.test)
@Order(-999)
@LazySingleton(as: AppConfig)
class TestAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "https://teamdefinex-mobile-auth-casestudy.vercel.app";

  @override
  String get name => "DefineX Test";

  @override
  AppRemoteConfig get remoteConfig {
    return AppRemoteConfig(
      version: "1.0.0",
      forceUpdateMessage: "Please update the app",
      updateUrl: "https://teamdefinex-mobile-auth-casestudy.vercel.app",
    );
  }
}

@Environment(Environment.dev)
@Order(-999)
@LazySingleton(as: AppConfig)
class DevAppConfigImpl extends AppConfig {
  final FirebaseRemoteConfig _config;
  DevAppConfigImpl(this._config);
  @override
  String get baseUrl => "https://teamdefinex-mobile-auth-casestudy.vercel.app";

  @override
  String get name => "DefineX Dev";

  @override
  AppRemoteConfig get remoteConfig {
    return AppRemoteConfig.fromJson(
        jsonDecode(_config.getValue("dev_config").asString()));
  }
}
