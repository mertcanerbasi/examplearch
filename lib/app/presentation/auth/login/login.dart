import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:examplearch/app/presentation/auth/login/login.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/info_message.dart';
import 'package:examplearch/core/widget/loading_dialog.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends BaseState<LoginViewModel, LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.appLocalizations.welcomeBack,
                textAlign: TextAlign.center,
                style: AppTextStyle.headlineMedium,
              ),
              20.verticalSpace,
              TextField(
                decoration: InputDecoration(
                  hintText: context.appLocalizations.email,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.ghostWhite.withOpacity(0.7),
                  ),
                ),
              ),
              20.verticalSpace,
              TextField(
                decoration: InputDecoration(
                  hintText: context.appLocalizations.password,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.ghostWhite.withOpacity(0.7),
                  ),
                  suffix: Container(
                      child: Icon(
                    Icons.visibility,
                    size: 15.r,
                    color: AppColors.ghostWhite.withOpacity(0.7),
                  )),
                ),
              ),
              5.verticalSpace,
              GestureDetector(
                onTap: () {
                  // TODO Forgot Password
                },
                child: Text(
                  context.appLocalizations.forgotPass,
                  textAlign: TextAlign.right,
                  style: AppTextStyle.captionRegular.copyWith(
                    color: AppColors.vividOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              50.verticalSpace,
              GestureDetector(
                onTap: () {
                  // TODO Login
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.appLocalizations.openAccount,
                      style: AppTextStyle.subheadingMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    15.horizontalSpace,
                    Container(
                      height: 35.r,
                      width: 35.r,
                      decoration: BoxDecoration(
                        color: AppColors.vividOrange,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Text(
                context.appLocalizations.loginWith,
                textAlign: TextAlign.center,
                style: AppTextStyle.captionRegular.copyWith(
                  color: AppColors.ghostWhite.withOpacity(0.7),
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight,
                          stops: [0.5, 0.7],
                          colors: [
                            Color(0xFF5C5C5D),
                            AppColors.neroBlack.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/apple.svg",
                        height: 20.r,
                        width: 20.r,
                      )),
                  25.horizontalSpace,
                  GestureDetector(
                    onTap: () async {
                      var loading = LoadingDialog.show(context);
                      await viewModel.signinGoogle().then(
                        (value) async {
                          if (value != null) {
                            await viewModel.saveUserInfo(value);
                            SplashRoute().pushAndRemoveUntil(
                              context,
                              (p0) => false,
                              rootNavigator: true,
                            );
                          }
                          return value;
                        },
                      ).whenComplete(
                        () {
                          loading.close();
                        },
                      ).onError(
                        (error, stackTrace) {
                          context.showSnacbar(
                              context.appLocalizations.errorGeneralOccured,
                              status: MessageStatus.error,
                              duration: SnackBarDuration.short);
                          return null;
                        },
                      );
                    },
                    child: Container(
                        height: 35.r,
                        width: 35.r,
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.centerRight,
                            stops: [0.5, 0.7],
                            colors: [
                              Color(0xFF5C5C5D),
                              AppColors.neroBlack.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/google.png",
                          height: 20.r,
                          width: 20.r,
                        )),
                  ),
                ],
              ),
              60.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
