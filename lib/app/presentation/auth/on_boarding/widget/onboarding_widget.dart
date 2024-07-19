import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/dots_indicator.dart';

class OnboardingWidget extends StatelessWidget {
  final VoidCallback onContinue;
  final int page;

  const OnboardingWidget(
      {Key? key, required this.onContinue, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables to hold different images and texts based on the page number
    late String imagePath;
    late String title;
    late String description;

    // Determine content based on the page number
    switch (page) {
      case 1:
        imagePath = 'assets/images/placeholder_onboarding.avif';
        title = context.appLocalizations.personalizedNutritionPlans;
        description = context.appLocalizations.getPersonalizedNutritionPlans;
        break;
      case 2:
        imagePath = 'assets/images/placeholder_onboarding.avif';
        title = context.appLocalizations.engagingChallenges;
        description = context.appLocalizations.stayEngagedWithWorkouts;
        break;
      case 3:
        imagePath = 'assets/images/placeholder_onboarding.avif';
        title = context.appLocalizations.individualizedFitnessPlans;
        description = context.appLocalizations.getPersonalizedFitnessPlans;
        break;
      case 4:
        imagePath = 'assets/images/placeholder_onboarding.avif';
        title = context.appLocalizations.supportiveCommunity;
        description = context.appLocalizations.socialNetworkDescription;
        break;
      default:
        // Handle default case, if needed
        imagePath = 'assets/images/placeholder_onboarding.avif';
        title = "Default Title";
        description = "Default description text.";
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 0.4.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        20.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.subheadingMedium.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        10.verticalSpace,
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyRegular,
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            onContinue.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.royalBlue,
          ),
          child: Text(
            context.appLocalizations.continueApp,
            style: AppTextStyle.button.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        50.verticalSpace,
        // 4 dots indicator
        DotsIndicator(
          currentPage: page,
          totalPages: 4,
        ),
      ],
    );
  }
}
