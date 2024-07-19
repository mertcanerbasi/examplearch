import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/auth/register_route/promise.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/animated_circular_button.dart';
import 'package:examplearch/core/widget/info_message.dart';
import 'package:examplearch/core/widget/loading_dialog.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class PromisePage extends StatefulWidget {
  const PromisePage({Key? key}) : super(key: key);
  @override
  _PromiseState createState() => _PromiseState();
}

class _PromiseState extends BaseState<PromiseViewModel, PromisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appLocalizations.commitment,
                style: AppTextStyle.headlineMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              25.verticalSpace,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: context.appLocalizations.readyToGetInShapeOne,
                      style: AppTextStyle.bodyRegular.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.vividOrange,
                      ),
                    ),
                    TextSpan(
                      text: " ${context.appLocalizations.readyToGetInShapeTwo}",
                      style: AppTextStyle.bodyRegular,
                    ),
                  ],
                ),
              ),
              25.verticalSpace,
              Text(
                context.appLocalizations.workingConsistently,
                style: AppTextStyle.bodyRegular,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AnimatedCircularButton(
                        size: 100.r,
                        onComplete: () async {
                          var loading = LoadingDialog.show(context);
                          await viewModel
                              .saveUserInfo(FirebaseAuth.instance.currentUser!)
                              .then((value) async {
                            SplashRoute().pushAndRemoveUntil(
                              context,
                              (p0) => false,
                              rootNavigator: true,
                            );

                            return value;
                          }).whenComplete(
                            () {
                              loading.close();
                            },
                          ).onError(
                            (error, stackTrace) {
                              context.showSnacbar(
                                  context.appLocalizations.errorGeneralOccured,
                                  status: MessageStatus.error,
                                  duration: SnackBarDuration.short);
                              return true;
                            },
                          );
                        },
                      ),
                      20.verticalSpace,
                      Text(
                        context.appLocalizations.pressAndHoldToContinue,
                        style: AppTextStyle.captionRegular,
                      ),
                    ],
                  ),
                ],
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
