// Dart imports:
import 'dart:async';
import 'dart:isolate';

// Flutter imports:
import 'package:examplearch/core/di/locator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// Package imports:
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  await runZonedGuarded(() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await setupDI(env);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      await FirebaseCrashlytics.instance.recordError(
        pair.first,
        pair.last,
        fatal: true,
      );
    }).sendPort);
    runApp(await builder());
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('Caught error: $error');
      print(stackTrace);
    }
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
