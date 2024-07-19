import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/data/model/enums/bmi_range.dart';
import 'package:examplearch/app/presentation/auth/register_route/weight_selection.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class WeightSelectionPage extends StatefulWidget {
  const WeightSelectionPage({Key? key}) : super(key: key);
  @override
  _WeightSelectionState createState() => _WeightSelectionState();
}

class _WeightSelectionState
    extends BaseState<WeightSelectionViewModel, WeightSelectionPage> {
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
                context.appLocalizations.weightQuestion,
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
                      viewModel.setweight(
                          index + 30); // Adjust index to start from 30
                      viewModel.notifyListeners();
                    },
                    children: List.generate(
                      201, // Adjust total items to cover the range 30 to 100 (100 - 30 + 1)
                      (index) => Center(
                        child: Text(
                          (index + 30)
                              .toString(), // Adjust index to start from 18
                          style: AppTextStyle.headlineMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    scrollController: FixedExtentScrollController(
                        initialItem: 70 - 30), // Initial item at 25
                  )),
              10.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: buildBmiText(),
              ),
              const Spacer(),
              DotsIndicator(
                currentPage: 5,
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
                  PromiseRoute().push(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  TextSpan buildBmiText() {
    if (viewModel.getBmiRange() == BmiRange.low) {
      return TextSpan(
        style: AppTextStyle.bodyRegular,
        text:
            '\n${context.appLocalizations.bmiValueTooLow} ${viewModel.lowWeightLimit.round()}-${viewModel.highWeightLimit.round()} kg',
      );
    } else if (viewModel.getBmiRange() == BmiRange.normal) {
      return TextSpan(
        style: AppTextStyle.bodyRegular,
        text:
            '\n${context.appLocalizations.bmiValueNormal} ${viewModel.lowWeightLimit.round()}-${viewModel.highWeightLimit.round()} kg',
      );
    } else {
      return TextSpan(
        style: AppTextStyle.bodyRegular,
        text:
            '\n${context.appLocalizations.bmiValueTooHigh} ${viewModel.lowWeightLimit.round()}-${viewModel.highWeightLimit.round()} kg',
      );
    }
  }
}
