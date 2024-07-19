import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 200.h,
          ),
          30.verticalSpace,
          Text(
            'Congralutations!',
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineMedium,
          ),
          20.verticalSpace,
          Text(
            'Your registration in the app has been successfuly completed.',
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyRegular,
          ),
          10.verticalSpace,
          Text(
            'To better understand your needs and goals, we invite you to complete a short survey.',
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyRegular,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              NameSelectionRoute().pushReplacement(context);
            },
            child: Text(
              context.appLocalizations.getStarted,
              style: AppTextStyle.button.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          50.verticalSpace,
        ],
      ),
    )));
  }
}
