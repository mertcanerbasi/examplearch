import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/profile/settings/settings.vm.dart';
import 'package:examplearch/app/router/app_router.routes.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/images.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/action_menu.dart';
import 'package:examplearch/core/widget/info_message.dart';
import 'package:examplearch/core/widget/loading_dialog.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends BaseState<SettingsViewModel, SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          ListTile(
            title: Text(context.appLocalizations.languageSettings),
            leading: Icon(Icons.language),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showActionMenu2(
                context,
                actionsBuilder: (c) => [
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              context.appLocalizations.english,
                            ),
                            leading: Image(
                              image: AppImages.english,
                              height: 18.r,
                            ),
                            trailing: viewModel.currentLanguageCode == "en"
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.accent,
                                    size: 15.r,
                                  )
                                : null,
                            onTap: () async {
                              Navigator.pop(c);
                              await viewModel.changeLocaleLanguage(1);
                            },
                          ),
                          ListTile(
                            title: Text(
                              context.appLocalizations.spanish,
                            ),
                            leading: Image(
                              image: AppImages.spanish,
                              height: 18.r,
                            ),
                            trailing: viewModel.currentLanguageCode == "es"
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.accent,
                                    size: 15.r,
                                  )
                                : null,
                            onTap: () async {
                              Navigator.pop(c);
                              await viewModel.changeLocaleLanguage(2);
                            },
                          ),
                          ListTile(
                            title: Text(
                              context.appLocalizations.turkish,
                            ),
                            leading: Image(
                              image: AppImages.turkish,
                              height: 18.r,
                            ),
                            trailing: viewModel.currentLanguageCode == "tr"
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.accent,
                                    size: 15.r,
                                  )
                                : null,
                            onTap: () async {
                              Navigator.pop(c);
                              await viewModel.changeLocaleLanguage(0);
                            },
                          ),
                        ],
                      )),
                ],
              );
            },
          ),
          5.verticalSpace,
          ListTile(
            title: Text(context.appLocalizations.notifications),
            leading: Icon(Icons.notifications),
            trailing: Switch.adaptive(
              value: viewModel.notificationSettings,
              onChanged: (value) async {
                viewModel
                    .setnotificationSettings(!viewModel.notificationSettings);
                try {
                  await viewModel.changeValueOf(
                      "notificationsEnabled", viewModel.notificationSettings);
                } catch (e) {
                  context.showSnacbar(context.appLocalizations.errorWhileUpdate,
                      status: MessageStatus.error,
                      duration: SnackBarDuration.short);
                }
              },
            ),
            onTap: () async {
              viewModel
                  .setnotificationSettings(!viewModel.notificationSettings);
              try {
                await viewModel.changeValueOf(
                    "notificationsEnabled", viewModel.notificationSettings);
              } catch (e) {
                context.showSnacbar(context.appLocalizations.errorWhileUpdate,
                    status: MessageStatus.error,
                    duration: SnackBarDuration.short);
              }
            },
          ),
          5.verticalSpace,
          ListTile(
            title: Text(
              context.appLocalizations.deleteAccount,
              style: TextStyle(color: AppColors.red),
            ),
            leading: Icon(
              Icons.no_accounts,
              color: AppColors.red,
            ),
            onTap: () {
              print("Delete Account");
            },
          ),
          5.verticalSpace,
          ListTile(
            title: Text(context.appLocalizations.logout),
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              var loading = LoadingDialog.show(context);
              await viewModel.logout().then(
                (value) {
                  SplashRoute().pushAndRemoveUntil(context, (p0) => false,
                      rootNavigator: true);
                },
              ).whenComplete(
                () {
                  loading.close();
                },
              ).onError(
                (error, stackTrace) {
                  print(error.toString());
                  return null;
                },
              );
            },
          ),
          5.verticalSpace,
        ],
      ),
    );
  }
}
