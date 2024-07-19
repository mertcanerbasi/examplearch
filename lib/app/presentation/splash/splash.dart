import 'package:flutter/material.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';

import 'package:route_map/route_map.dart';

@RouteMap(name: "splash")
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Text(
            "Splash",
            style: AppTextStyle.titleMedium,
          ),
        ));
  }
}
