// Package imports:

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:examplearch/core/base/base_view_model.dart';
import 'package:examplearch/core/config.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:examplearch/core/res/constants.dart';
import 'package:examplearch/core/util/siren.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:package_info_plus/package_info_plus.dart';

@Singleton()
class AppViewModel extends BaseViewModel {
  final PackageInfo _packageInfo;
  final AppConfig _appConfig;
  final LocalDataSource _localDataSource;
  AppViewModel(
    this._packageInfo,
    this._appConfig,
    this._localDataSource,
  ) {
    Intl.defaultLocale = "en";
    var siren = Siren();
    siren.setMajorUpdateAlertType(SirenType.force);
    String? version = _appConfig.remoteConfig.version;
    if (version != null) {
      siren.checkVersionName(
          minVersion: version,
          currentVersion: _packageInfo.version,
          onDetectNewVersion: (version, type) {
            _sirenType = type;
            notifyListeners();
          },
          forceUpdateEnabled: true,
          versionCheckEnabled: true);
    }
  }
  final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;

  String? get updateMessage => _appConfig.remoteConfig.forceUpdateMessage;

  String get appName => _appConfig.name;
  SirenType _sirenType = SirenType.none;
  SirenType get sirenType => _sirenType;
  setSirenType(SirenType type) {
    _sirenType = type;
    notifyListeners();
  }

  String get platformLocale {
    if (_localDataSource.languageCode == null) {
      if (AppConstants.supportedLanguages
          .contains(Platform.localeName.split('_')[0].toUpperCase())) {
        return Platform.localeName;
      } else {
        return "en";
      }
    } else {
      return _localDataSource.languageCode!;
    }
  }

  bool _hasConnection = true;
  bool get hasConnection => _hasConnection;
  void setConnectionStatus(bool status) {
    _hasConnection = status;
    notifyListeners();
  }
}
