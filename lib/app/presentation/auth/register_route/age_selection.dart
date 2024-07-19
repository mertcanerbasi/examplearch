import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/auth/register_route/age_selection.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class AgeSelectionPage extends StatefulWidget {
  const AgeSelectionPage({Key? key}) : super(key: key);
  @override
  _AgeSelectionState createState() => _AgeSelectionState();
}

class _AgeSelectionState
    extends BaseState<AgeSelectionViewModel, AgeSelectionPage> {
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
                context.appLocalizations.ageQuestion,
                textAlign: TextAlign.center,
                style: AppTextStyle.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                  height: 200.h,
                  child: CupertinoPicker(
                    itemExtent: 40.h,
                    onSelectedItemChanged: (index) {
                      viewModel.registerUserModel.age =
                          index + 18; // Adjust index to start from 18
                    },
                    children: List.generate(
                      83, // Adjust total items to cover the range 18 to 100 (100 - 18 + 1)
                      (index) => Center(
                        child: Text(
                          (index + 18)
                              .toString(), // Adjust index to start from 18
                          style: AppTextStyle.headlineMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    scrollController: FixedExtentScrollController(
                        initialItem: 25 - 18), // Initial item at 25
                  )),
              const Spacer(),
              DotsIndicator(
                currentPage: 3,
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
                onPressed: () {
                  HeightSelectionRoute().push(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
