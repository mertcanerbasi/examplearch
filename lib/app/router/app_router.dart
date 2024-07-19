import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';

import 'package:route_map/route_map.dart';

@RouteMapInit(typeSafe: true)
Route? onGenerateRoute(RouteSettings routeSettings) =>
    $onGenerateRoute(routeSettings, redirect: (route) {
      //FirebaseAuth.instance.signOut();

      if (RouteMaps.splashRoute.contains(route)) {
        var _localDataSource = getIt<LocalDataSource>();
        var user = _localDataSource.loginResponse;
        if (FirebaseAuth.instance.currentUser != null && user != null) {
          return RouteMaps.root;
        } else if (FirebaseAuth.instance.currentUser != null) {
          return RouteMaps.registrationSuccessRoute;
        } else if (_localDataSource.onBoarded) {
          return RouteMaps.authRoute;
        } else {
          return RouteMaps.onboardingRoute;
        }
      }
      return route;
    });
