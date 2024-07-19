import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/auth/register_route/height_selection.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class HeightSelectionPage extends StatefulWidget {
  const HeightSelectionPage({Key? key}) : super(key: key);
  @override
  _HeightSelectionState createState() => _HeightSelectionState();
}

class _HeightSelectionState
    extends BaseState<HeightSelectionViewModel, HeightSelectionPage> {
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
                context.appLocalizations.heightQuestion,
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
                      viewModel.registerUserModel.height =
                          index + 140; // Adjust index to start from 18
                    },
                    children: List.generate(
                      81, // Adjust total items to cover the range 18 to 100 (100 - 18 + 1)
                      (index) => Center(
                        child: Text(
                          (index + 140)
                              .toString(), // Adjust index to start from 18
                          style: AppTextStyle.headlineMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    scrollController: FixedExtentScrollController(
                        initialItem: 175 - 140), // Initial item at 25
                  )),
              const Spacer(),
              DotsIndicator(
                currentPage: 4,
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
                  WeightSelectionRoute().push(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
