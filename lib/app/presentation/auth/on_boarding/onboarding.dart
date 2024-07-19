import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/auth/on_boarding/onboarding.vm.dart';
import 'package:examplearch/app/presentation/auth/on_boarding/widget/onboarding_widget.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/di/locator.dart';
import 'package:examplearch/core/local_data_source/local_data_source.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends BaseState<OnboardingViewModel, Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await getIt<LocalDataSource>().setOnBoarded(true);
              AuthRoute().pushReplacement(context);
            },
            child: Text(
              context.appLocalizations.skip,
              style: AppTextStyle.captionRegular.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.text,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      //Slidable 4 steps onboarding
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: OnboardingWidget(
            page: viewModel.currentPage,
            onContinue: () async {
              if (viewModel.currentPage < 4) {
                viewModel.setcurrentPage(viewModel.currentPage + 1);
              } else {
                await getIt<LocalDataSource>().setOnBoarded(true);
                AuthRoute().pushReplacement(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
