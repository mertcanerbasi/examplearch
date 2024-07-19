import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:examplearch/app/data/model/enums/gender_enum.dart';
import 'package:examplearch/app/presentation/profile/profile.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/images.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/action_menu.dart';
import 'package:examplearch/core/widget/info_message.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<ProfileViewModel, ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.appLocalizations.profile,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: AppColors.primary,
              ),
              onPressed: () {
                SettingsRoute().push(context);
              },
            )
          ],
        ),
        body: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              titleAlignment: ListTileTitleAlignment.center,
              leading: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
                child: SvgPicture.asset(
                  SvgLocations.weightLifter,
                  height: 40.r,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              title: Text(
                context.appLocalizations.athlete,
                style: AppTextStyle.bodyMedium,
              ),
              subtitle: Text(
                viewModel.userInfo?.name ?? "",
                style: AppTextStyle.bodyRegular,
              ),
              onTap: () {
                viewModel.nameController.text = viewModel.userInfo?.name ?? "";
                showActionMenu2(
                  context,
                  actionsBuilder: (c) {
                    return [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              controller: viewModel.nameController,
                              style: AppTextStyle.bodyRegular,
                              maxLength: 20,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                label: Text(
                                  context.appLocalizations.yourName,
                                  style: AppTextStyle.bodyMedium,
                                ),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            ),
                            20.verticalSpace,
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              child: Text(
                                context.appLocalizations.save,
                                style: AppTextStyle.bodyMedium
                                    .copyWith(color: AppColors.primary),
                              ),
                              onPressed: () async {
                                Navigator.pop(c);
                                try {
                                  var name = viewModel.nameController.text;
                                  await viewModel.changeValueOf("age", name);
                                } catch (e) {
                                  context.showSnacbar(
                                      context.appLocalizations.nameCharError,
                                      status: MessageStatus.error,
                                      duration: SnackBarDuration.short);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ];
                  },
                );
              },
            ),
            5.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(
                        SvgLocations.time,
                        height: 30.r,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: Text(
                      context.appLocalizations.age,
                      style: AppTextStyle.bodyMedium,
                    ),
                    subtitle: Text(
                      "${viewModel.userInfo!.age}",
                      style: AppTextStyle.bodyRegular,
                    ),
                    onTap: () {
                      viewModel.ageController.text =
                          viewModel.userInfo?.age.toString() ?? "";
                      showActionMenu2(
                        context,
                        actionsBuilder: (c) {
                          return [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextField(
                                    controller: viewModel.ageController,
                                    style: AppTextStyle.bodyRegular,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text(
                                        context.appLocalizations.yourAge,
                                        style: AppTextStyle.bodyMedium,
                                      ),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      context.appLocalizations.save,
                                      style: AppTextStyle.bodyMedium
                                          .copyWith(color: AppColors.primary),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(c);
                                      try {
                                        var age = int.tryParse(
                                            viewModel.ageController.text);
                                        await viewModel.changeValueOf(
                                            "age", age);
                                      } catch (e) {
                                        context.showSnacbar(
                                            context.appLocalizations
                                                .errorWhileUpdate,
                                            status: MessageStatus.error,
                                            duration: SnackBarDuration.short);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ];
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(
                        SvgLocations.gender,
                        height: 25.r,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: Text(
                      context.appLocalizations.gender,
                      style: AppTextStyle.bodyMedium,
                    ),
                    subtitle: Text(
                      decideGender(context, viewModel.userInfo!.gender),
                      style: AppTextStyle.bodyRegular,
                    ),
                    onTap: () {
                      viewModel.setcurrentGender(
                          viewModel.userInfo?.gender ?? Gender.male);
                      showActionMenu2(context, actionsBuilder: (c) {
                        return [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Column(
                              children: [
                                // GenderSelectionBox(
                                //   onTap: () async {
                                //     Navigator.pop(c);
                                //     viewModel.setcurrentGender(Gender.female);
                                //     try {
                                //       await viewModel.changeValueOf(
                                //           "gender", viewModel.currentGender);
                                //     } catch (e) {
                                //       context.showSnacbar(
                                //           context.appLocalizations
                                //               .errorWhileUpdate,
                                //           status: MessageStatus.error,
                                //           duration: SnackBarDuration.short);
                                //     }
                                //   },
                                //   showImage: false,
                                //   height: 50.h,
                                //   gender: Gender.female,
                                //   selectedGender:
                                //       viewModel.currentGender ?? Gender.male,
                                // ),
                                // 5.verticalSpace,
                                // GenderSelectionBox(
                                //   onTap: () async {
                                //     Navigator.pop(c);
                                //     viewModel.setcurrentGender(Gender.male);
                                //     try {
                                //       await viewModel.changeValueOf(
                                //           "gender", viewModel.currentGender);
                                //     } catch (e) {
                                //       context.showSnacbar(
                                //           context.appLocalizations
                                //               .errorWhileUpdate,
                                //           status: MessageStatus.error,
                                //           duration: SnackBarDuration.short);
                                //     }
                                //   },
                                //   height: 50.h,
                                //   showImage: false,
                                //   gender: Gender.male,
                                //   selectedGender:
                                //       viewModel.currentGender ?? Gender.male,
                                // ),
                                // 5.verticalSpace,
                                // GenderSelectionBox(
                                //   onTap: () async {
                                //     Navigator.pop(c);
                                //     viewModel.setcurrentGender(Gender.unknown);
                                //     try {
                                //       await viewModel.changeValueOf(
                                //           "gender", viewModel.currentGender);
                                //     } catch (e) {
                                //       context.showSnacbar(
                                //           context.appLocalizations
                                //               .errorWhileUpdate,
                                //           status: MessageStatus.error,
                                //           duration: SnackBarDuration.short);
                                //     }
                                //   },
                                //   height: 50.h,
                                //   gender: Gender.unknown,
                                //   selectedGender:
                                //       viewModel.currentGender ?? Gender.male,
                                // ),
                                // 5.verticalSpace,
                                // GenderSelectionBox(
                                //   onTap: () async {
                                //     Navigator.pop(c);
                                //     viewModel.setcurrentGender(Gender.none);
                                //     try {
                                //       await viewModel.changeValueOf(
                                //           "gender", viewModel.currentGender);
                                //     } catch (e) {
                                //       context.showSnacbar(
                                //           context.appLocalizations
                                //               .errorWhileUpdate,
                                //           status: MessageStatus.error,
                                //           duration: SnackBarDuration.short);
                                //     }
                                //   },
                                //   height: 50.h,
                                //   gender: Gender.none,
                                //   selectedGender:
                                //       viewModel.currentGender ?? Gender.male,
                                // ),
                              ],
                            ),
                          )
                        ];
                      });
                    },
                  ),
                ),
              ],
            ),
            5.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(
                        SvgLocations.height,
                        height: 25.r,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: Text(
                      context.appLocalizations.height,
                      style: AppTextStyle.bodyMedium,
                    ),
                    subtitle: Text(
                      "${viewModel.userInfo!.height} cm",
                      style: AppTextStyle.bodyRegular,
                    ),
                    onTap: () {
                      viewModel.heightController.text =
                          viewModel.userInfo?.height.toString() ?? "";
                      showActionMenu2(
                        context,
                        actionsBuilder: (c) {
                          return [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextField(
                                    controller: viewModel.heightController,
                                    style: AppTextStyle.bodyRegular,
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text(
                                        context.appLocalizations.yourHeight,
                                        style: AppTextStyle.bodyMedium,
                                      ),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      context.appLocalizations.save,
                                      style: AppTextStyle.bodyMedium
                                          .copyWith(color: AppColors.primary),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(c);
                                      try {
                                        var height = int.tryParse(
                                            viewModel.heightController.text);
                                        await viewModel.changeValueOf(
                                            "height", height);
                                      } catch (e) {
                                        context.showSnacbar(
                                            context.appLocalizations
                                                .errorWhileUpdate,
                                            status: MessageStatus.error,
                                            duration: SnackBarDuration.short);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ];
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(
                        SvgLocations.weight,
                        height: 25.r,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: Text(
                      context.appLocalizations.weight,
                      style: AppTextStyle.bodyMedium,
                    ),
                    subtitle: Text(
                      "${viewModel.userInfo!.weight} kg",
                      style: AppTextStyle.bodyRegular,
                    ),
                    onTap: () {
                      viewModel.weightController.text =
                          viewModel.userInfo?.weight.toString() ?? "";
                      showActionMenu2(
                        context,
                        actionsBuilder: (c) {
                          return [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextField(
                                    controller: viewModel.weightController,
                                    style: AppTextStyle.bodyRegular,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text(
                                        context.appLocalizations.yourWeight,
                                        style: AppTextStyle.bodyMedium,
                                      ),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      context.appLocalizations.save,
                                      style: AppTextStyle.bodyMedium
                                          .copyWith(color: AppColors.primary),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(c);
                                      try {
                                        var weight = double.tryParse(
                                            viewModel.weightController.text);
                                        await viewModel.changeValueOf(
                                            "weight", weight);
                                      } catch (e) {
                                        context.showSnacbar(
                                            context.appLocalizations
                                                .errorWhileUpdate,
                                            status: MessageStatus.error,
                                            duration: SnackBarDuration.short);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ];
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            5.verticalSpace,
          ],
        ));
  }
}
