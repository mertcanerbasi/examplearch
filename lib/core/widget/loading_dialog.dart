// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/core/res/colors.dart';
import 'package:examplearch/core/res/images.dart';

class LoadingDialog {
  bool _isShow = false;
  late BuildContext _context;
  LoadingDialog._(BuildContext context) {
    if (!_isShow) {
      _context = context;
      _isShow = true;
      showDialog(
          useRootNavigator: true,
          barrierDismissible: false,
          context: _context,
          builder: (_) => PopScope(
                canPop: false,
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Center(
                      child: Card(
                    color: AppColors.vividOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.r),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AppImages.loading,
                        color: AppColors.ghostWhite,
                        width: 48.r,
                        height: 48.r,
                      ),
                    ),
                  )),
                ),
              ));
    }
  }
  static LoadingDialog show(BuildContext context) {
    return LoadingDialog._(context);
  }

  void close() {
    if (_isShow) {
      _isShow = false;
      if (Navigator.of(_context, rootNavigator: true).canPop()) {
        Navigator.of(_context, rootNavigator: true).pop();
      }
    }
  }
}
