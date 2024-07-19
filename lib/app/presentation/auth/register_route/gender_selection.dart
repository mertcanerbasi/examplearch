import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/presentation/auth/register_route/gender_selection.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({Key? key}) : super(key: key);
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState
    extends BaseState<GenderSelectionViewModel, GenderSelectionPage> {
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
                context.appLocalizations.genderQuestion,
                textAlign: TextAlign.center,
                style: AppTextStyle.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              20.verticalSpace,
              GenderSelectionBox(
                onTap: () {
                  viewModel.setselectedGender(Gender.female);
                },
                tilesGender: Gender.female,
                selectedGender: viewModel.selectedGender,
              ),
              20.verticalSpace,
              GenderSelectionBox(
                onTap: () {
                  viewModel.setselectedGender(Gender.male);
                },
                tilesGender: Gender.male,
                selectedGender: viewModel.selectedGender,
              ),
              20.verticalSpace,
              GenderSelectionBox(
                onTap: () {
                  viewModel.setselectedGender(Gender.other);
                },
                tilesGender: Gender.other,
                selectedGender: viewModel.selectedGender,
              ),
              const Spacer(),
              DotsIndicator(
                currentPage: 2,
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
                  viewModel.registerUserModel.gender = viewModel.selectedGender;
                  AgeSelectionRoute().push(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelectionBox extends StatelessWidget {
  const GenderSelectionBox({
    super.key,
    required this.onTap,
    required this.selectedGender,
    required this.tilesGender,
  });

  final VoidCallback onTap;
  final Gender tilesGender;
  final Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.textFieldBg,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Text(
              decideGender(context, tilesGender),
              style: AppTextStyle.bodyMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Icon(
              tilesGender == Gender.female
                  ? Icons.female
                  : tilesGender == Gender.male
                      ? Icons.male
                      : Icons.circle_outlined,
              color: selectedGender == tilesGender
                  ? AppColors.vividOrange
                  : Colors.white,
              size: 25.r,
            ),
          ],
        ),
      ),
    );
  }
}
