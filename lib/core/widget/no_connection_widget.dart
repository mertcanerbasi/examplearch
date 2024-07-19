import 'package:flutter/material.dart';
import 'package:examplearch/app/presentation/app/app.vm.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: Container(
        color: AppColors.backgroundColor,
        child: Row(
          children: [
            Icon(
              Icons.wifi_off,
              color: AppColors.red,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              context.appLocalizations.noConnection,
              style: TextStyle(color: AppColors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            var hasConnection = await InternetConnectionChecker().hasConnection;
            if (hasConnection) {
              getIt<AppViewModel>().setConnectionStatus(true);
            }
          },
          child: Icon(
            Icons.refresh,
            color: AppColors.red,
            size: 20,
          ),
        ),
      ],
      backgroundColor: AppColors
          .backgroundColor, // Ensure the banner's background color is red
    );
  }
}
