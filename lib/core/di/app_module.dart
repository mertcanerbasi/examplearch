// Flutter imports:

import 'package:device_info_plus/device_info_plus.dart';

// Package imports:

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:examplearch/firebase_options.dart';
import 'package:injectable/injectable.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../logger.dart';

// Project imports:

@module
abstract class AppModule {
  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @Order(-1001)
  @preResolve
  Future<GetStorage> get storage async {
    await GetStorage.init("MyStorage");
    return GetStorage("MyStorage");
  }

  @Environment(Environment.prod)
  @Order(-1000)
  @preResolve
  Future<FirebaseApp> get firebaseApp {
    WidgetsFlutterBinding.ensureInitialized();
    return Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @Environment(Environment.dev)
  @Order(-1000)
  @preResolve
  Future<FirebaseApp> get devFirebaseApp {
    WidgetsFlutterBinding.ensureInitialized();
    return Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentDevPlatform);
  }

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @Order(-999)
  @preResolve
  Future<FirebaseRemoteConfig> get remoteConfigService async {
    var conf = FirebaseRemoteConfig.instance;
    await conf.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 10),
    ));
    try {
      await conf.fetchAndActivate();
    } catch (e) {
      Log.e(e.toString());
    }
    return conf;
  }

  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  // For testing purposes only (unit tests)
  // Since tests does not run on an actual device or emulator, we need to provide a mock package info
  @Environment(Environment.test)
  PackageInfo get packageInfoTest => PackageInfo(
        appName: "Test",
        packageName: "com.test",
        version: "1.0.0",
        buildNumber: "1",
      );

  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();
}
