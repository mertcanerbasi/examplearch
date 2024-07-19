// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:examplearch/app/presentation/app/app.vm.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/res/images.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/util/siren.dart';

// Project imports:
//import 'package:url_launcher/url_launcher.dart';

class ForceUpdatePage extends StatelessWidget {
  final SirenType sirenType;
  final String? message;
  const ForceUpdatePage(
      {super.key, required this.sirenType, required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Image(
                image: AppImages.logo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    context.appLocalizations.updateAvaiable,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    message ?? context.appLocalizations.forceUpdateDefault,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (Platform.isIOS) {
                    //   launchUrl(Uri.parse(
                    //       "https://apps.apple.com/us/app/ko%C3%A7ta%C5%9F-miss/id6477375016"));
                  }

                  if (Platform.isAndroid) {
                    // launchUrl(Uri.parse(
                    //     "https://play.google.com/store/apps/details?id=tr.com.koctas.miss_new"));
                  }
                },
                child: Text(context.appLocalizations.update)),
            if (sirenType == SirenType.skip || sirenType == SirenType.option)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        getIt<AppViewModel>().setSirenType(SirenType.none);
                      },
                      child: Text(context.appLocalizations.skip)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
