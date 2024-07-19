// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:examplearch/app/presentation/home/home.dart';
import 'package:examplearch/app/presentation/splash/splash.dart';
import 'package:examplearch/app/presentation/auth/register_route/name_selection.dart';
import 'package:examplearch/app/presentation/auth/register_route/promise.dart';
import 'package:examplearch/app/presentation/auth/register_route/weight_selection.dart';
import 'package:examplearch/app/presentation/auth/register_route/age_selection.dart';
import 'package:examplearch/app/presentation/auth/register_route/height_selection.dart';
import 'package:examplearch/app/presentation/auth/on_boarding/onboarding.dart';
import 'package:examplearch/app/presentation/profile/settings/settings.dart';
import 'package:examplearch/app/presentation/profile/profile.dart';
import 'package:examplearch/app/presentation/root/root_page.dart';
import 'package:examplearch/app/presentation/auth/auth.dart';
import 'package:examplearch/app/presentation/auth/login/login.dart';
import 'package:examplearch/app/presentation/auth/register/register.dart';
import 'package:examplearch/app/presentation/auth/registration_success/registration_success.dart';
import 'package:examplearch/app/presentation/auth/register_route/gender_selection.dart';

class RouteMaps {
  static const String homeRoute = "/home_page";
  static const String splashRoute = "splash";
  static const String nameSelectionRoute = "/name_selection_page";
  static const String promiseRoute = "/promise_page";
  static const String weightSelectionRoute = "/weight_selection_page";
  static const String ageSelectionRoute = "/age_selection_page";
  static const String heightSelectionRoute = "/height_selection_page";
  static const String onboardingRoute = "/onboarding";
  static const String settingsRoute = "/settings_page";
  static const String profileRoute = "/profile_page";
  static const String root = "/";
  static const String authRoute = "/auth_page";
  static const String loginRoute = "/login_page";
  static const String registerRoute = "/register_page";
  static const String registrationSuccessRoute = "/registration_success";
  static const String genderSelectionRoute = "/gender_selection_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.splashRoute: RouteModel(
    (_) => const SplashPage(),
  ),
  RouteMaps.nameSelectionRoute: RouteModel(
    (_) => const NameSelectionPage(),
  ),
  RouteMaps.promiseRoute: RouteModel(
    (_) => const PromisePage(),
  ),
  RouteMaps.weightSelectionRoute: RouteModel(
    (_) => const WeightSelectionPage(),
  ),
  RouteMaps.ageSelectionRoute: RouteModel(
    (_) => const AgeSelectionPage(),
  ),
  RouteMaps.heightSelectionRoute: RouteModel(
    (_) => const HeightSelectionPage(),
  ),
  RouteMaps.onboardingRoute: RouteModel(
    (_) => const Onboarding(),
  ),
  RouteMaps.settingsRoute: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.profileRoute: RouteModel(
    (_) => const ProfilePage(),
  ),
  RouteMaps.root: RouteModel(
    (_) => const RootPage(),
  ),
  RouteMaps.authRoute: RouteModel(
    (_) => const AuthPage(),
  ),
  RouteMaps.loginRoute: RouteModel(
    (_) => const LoginPage(),
  ),
  RouteMaps.registerRoute: RouteModel(
    (_) => const RegisterPage(),
  ),
  RouteMaps.registrationSuccessRoute: RouteModel(
    (_) => const RegistrationSuccess(),
  ),
  RouteMaps.genderSelectionRoute: RouteModel(
    (_) => const GenderSelectionPage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings,
        {String? Function(String routeName)? redirect}) =>
    onGenerateRouteWithRoutesSettings(
      routeSettings,
      routes,
      redirect: redirect,
    );

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.homeRoute);
  static const String name = RouteMaps.homeRoute;
}

class SplashRoute extends BaseRoute {
  SplashRoute() : super(RouteMaps.splashRoute);
  static const String name = RouteMaps.splashRoute;
}

class NameSelectionRoute extends BaseRoute {
  NameSelectionRoute() : super(RouteMaps.nameSelectionRoute);
  static const String name = RouteMaps.nameSelectionRoute;
}

class PromiseRoute extends BaseRoute {
  PromiseRoute() : super(RouteMaps.promiseRoute);
  static const String name = RouteMaps.promiseRoute;
}

class WeightSelectionRoute extends BaseRoute {
  WeightSelectionRoute() : super(RouteMaps.weightSelectionRoute);
  static const String name = RouteMaps.weightSelectionRoute;
}

class AgeSelectionRoute extends BaseRoute {
  AgeSelectionRoute() : super(RouteMaps.ageSelectionRoute);
  static const String name = RouteMaps.ageSelectionRoute;
}

class HeightSelectionRoute extends BaseRoute {
  HeightSelectionRoute() : super(RouteMaps.heightSelectionRoute);
  static const String name = RouteMaps.heightSelectionRoute;
}

class OnboardingRoute extends BaseRoute {
  OnboardingRoute() : super(RouteMaps.onboardingRoute);
  static const String name = RouteMaps.onboardingRoute;
}

class SettingsRoute extends BaseRoute {
  SettingsRoute() : super(RouteMaps.settingsRoute);
  static const String name = RouteMaps.settingsRoute;
}

class ProfileRoute extends BaseRoute {
  ProfileRoute() : super(RouteMaps.profileRoute);
  static const String name = RouteMaps.profileRoute;
}

class RootRoute extends BaseRoute {
  RootRoute() : super(RouteMaps.root);
  static const String name = RouteMaps.root;
}

class AuthRoute extends BaseRoute {
  AuthRoute() : super(RouteMaps.authRoute);
  static const String name = RouteMaps.authRoute;
}

class LoginRoute extends BaseRoute {
  LoginRoute() : super(RouteMaps.loginRoute);
  static const String name = RouteMaps.loginRoute;
}

class RegisterRoute extends BaseRoute {
  RegisterRoute() : super(RouteMaps.registerRoute);
  static const String name = RouteMaps.registerRoute;
}

class RegistrationSuccessRoute extends BaseRoute {
  RegistrationSuccessRoute() : super(RouteMaps.registrationSuccessRoute);
  static const String name = RouteMaps.registrationSuccessRoute;
}

class GenderSelectionRoute extends BaseRoute {
  GenderSelectionRoute() : super(RouteMaps.genderSelectionRoute);
  static const String name = RouteMaps.genderSelectionRoute;
}
