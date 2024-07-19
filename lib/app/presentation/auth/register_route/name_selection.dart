import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/auth/register_route/name_selection.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class NameSelectionPage extends StatefulWidget {
  const NameSelectionPage({Key? key}) : super(key: key);
  @override
  _RegisterOneState createState() => _RegisterOneState();
}

class _RegisterOneState
    extends BaseState<NameSelectionViewModel, NameSelectionPage> {
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
                context.appLocalizations.nameQuestion,
                textAlign: TextAlign.center,
                style: AppTextStyle.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              TextField(
                textAlign: TextAlign.center,
                style: AppTextStyle.headlineMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                controller: viewModel.nameController,
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  if (value.characters.length >= 3) {
                    viewModel.setisButtonEnabled(true);
                  } else {
                    viewModel.setisButtonEnabled(false);
                  }
                },
                decoration: InputDecoration(
                  hintText: context.appLocalizations.yourName,
                  hintStyle: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.ghostWhite.withOpacity(0.7),
                  ),
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
              const Spacer(),
              DotsIndicator(
                currentPage: 1,
                totalPages: 5,
              ),
              30.verticalSpace,
              ElevatedButton(
                child: SizedBox(
                    width: double.maxFinite,
                    child: Center(
                        child: Text(
                      context.appLocalizations.continueApp,
                      style: AppTextStyle.button.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ))),
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: AppColors.royalBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  ),
                ),
                onPressed: viewModel.isButtonEnabled
                    ? () {
                        viewModel.registerUserModel.name =
                            viewModel.nameController.text;
                        GenderSelectionRoute().push(context);
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
