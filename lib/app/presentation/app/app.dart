// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:examplearch/app/data/service/auth_service.dart';
import 'package:examplearch/app/presentation/app/app.vm.dart';
import 'package:examplearch/app/presentation/auth/auth.dart';
import 'package:examplearch/app/presentation/splash/splash.dart';
import 'package:examplearch/app/router/app_router.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/logger.dart';
import 'package:examplearch/core/res/theme.dart';
import 'package:examplearch/core/util/siren.dart';
import 'package:examplearch/core/widget/force_update_page.dart';
import 'package:examplearch/core/widget/no_connection_widget.dart';
import 'package:examplearch/core/widget/unknown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<AppViewModel, MyApp> {
  @override
  Widget build(BuildContext context) {
    Log.i(viewModel.platformLocale);
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: MaterialApp(
            title: 'examplearchl',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.theme(),
            navigatorKey: viewModel.mainNavigatorKey,
            initialRoute: RouteMaps.splashRoute,
            onUnknownRoute: (settings) =>
                MaterialPageRoute(builder: (_) => const UnknownPage()),
            locale: Locale(viewModel.platformLocale),
            onGenerateRoute: onGenerateRoute,
            builder: (context, child) {
              return Stack(
                children: [
                  child!, // Your home page widget
                  if (viewModel.sirenType != SirenType.none)
                    ForceUpdatePage(
                      sirenType: viewModel.sirenType,
                      message: viewModel.updateMessage,
                    ),
                  if (viewModel.hasConnection == false) NoConnectionWidget(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
