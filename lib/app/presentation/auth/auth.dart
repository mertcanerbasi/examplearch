import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:route_map/route_map.dart';
import 'package:examplearch/app/presentation/auth/auth.vm.dart';
import 'package:examplearch/core/base/base_widget.dart';

@RouteMap()
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends BaseState<AuthPageViewModel, AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/placeholder_onboarding.avif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100.h,
                    ),
                    20.verticalSpace,
                    Text(context.appLocalizations.welcomeexamplearchl,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.headlineMedium),
                    5.verticalSpace,
                    Text(
                      context.appLocalizations.personalSportAssistant,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.subheadingMedium.copyWith(),
                    ),
                    20.verticalSpace,
                    ElevatedButton(
                      onPressed: () {
                        RegisterRoute().push(context);
                      },
                      child: Text(
                        context.appLocalizations.getStarted,
                        style: AppTextStyle.button.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyle.bodyRegular,
                        children: [
                          TextSpan(
                            text: context.appLocalizations.alreadyHaveAccount,
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: context.appLocalizations.openAccount,
                            style: AppTextStyle.bodyMedium.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.royalBlue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle onTap action here
                                // Example: Navigate to login screen
                                LoginRoute().push(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
