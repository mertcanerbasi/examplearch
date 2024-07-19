// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/dimens.dart';
import 'package:examplearch/core/res/text_style.dart';

// Project imports:

class AppTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSwatch(
        //     brightness: isDark ? Brightness.dark : Brightness.light,
        //     primarySwatch: AppColors.primarySwatch),
        // toggleableActiveColor: AppColors.primarySwatch,
        highlightColor: Colors.transparent,
        splashColor: AppColors.vividOrange.withOpacity(0.2),
        colorScheme: ColorScheme.light(
            primary: AppColors.primarySwatch,
            secondary: AppColors.primarySwatch),
        scaffoldBackgroundColor: AppColors.neroBlack,
        indicatorColor: AppColors.primarySwatch,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          color: AppColors.neroBlack,
          titleTextStyle:
              AppTextStyle.bodyRegular.copyWith(color: AppColors.primary),
        ),
        listTileTheme:
            ListTileThemeData(titleTextStyle: AppTextStyle.captionRegular),
        textTheme: TextTheme(),
        dividerTheme: const DividerThemeData(space: 1),
        // textTheme: textTheme,
        buttonTheme: buttonTheme,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.xs)),
        ),

        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.royalBlue,
            padding: EdgeInsets.all(8.r),
            fixedSize: Size(1.sw, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),

        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 2,
          iconColor: AppColors.ghostWhite.withOpacity(0.7),
          hintStyle: AppTextStyle.captionRegular
              .copyWith(color: AppColors.ghostWhite.withOpacity(0.7)),
          fillColor: AppColors.textFieldBg,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
        ),
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: AppColors.primarySwatch,
          textColor: AppColors.primarySwatch,
          // collapsedBackgroundColor: AppColors.scaffoldBackgroundColor.lighten(),
          // backgroundColor: AppColors.scaffoldBackgroundColor.lighten(),
        ),
        // listTileTheme: ListTileThemeData(
        //     tileColor: AppColors.scaffoldBackgroundColor.lighten()),
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: 1,
    backgroundColor: AppColors.neroBlack,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.vividOrange,
    enableFeedback: false,
    unselectedItemColor: AppColors.textFieldBg.lighten(0.3),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedLabelStyle: AppTextStyle.bodyRegular,
  );

  static ButtonThemeData buttonTheme = ButtonThemeData(
    padding: EdgeInsets.all(8.r),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    padding: EdgeInsets.all(8.r),
  ));

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    // side: BorderSide(color: AppColors.primarySwatch),
    padding: EdgeInsets.all(8.r),
  ));
}
