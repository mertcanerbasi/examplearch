// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/app_dialog.dart';

IconData _getIcon(MessageStatus s) {
  switch (s) {
    case MessageStatus.success:
      return Icons.info;
    case MessageStatus.error:
      return Icons.error;
    case MessageStatus.info:
      return Icons.info;
    case MessageStatus.warning:
      return Icons.warning;
    default:
      return Icons.info;
  }
}

Color _getColor(MessageStatus s) {
  switch (s) {
    case MessageStatus.success:
      return Colors.green;
    case MessageStatus.error:
      return Colors.red;
    case MessageStatus.info:
      return Colors.blue;
    case MessageStatus.warning:
      return Colors.yellow.shade800;
    default:
      return Colors.blue;
  }
}

Duration _getTime(SnackBarDuration s) {
  switch (s) {
    case SnackBarDuration.indefinite:
      return const Duration(minutes: 1);
    case SnackBarDuration.long:
      return const Duration(milliseconds: 2750);
    default:
      return const Duration(milliseconds: 1500);
  }
}

enum MessageStatus { success, error, info, warning }

enum SnackBarDuration { indefinite, long, short }

extension BuildContextEx on BuildContext {
  Future showInfoDialog(String title, String message,
      {MessageStatus status = MessageStatus.success, Function? action}) {
    return showDialog(
        context: this,
        builder: (c) {
          return AppDialog(
            icon: Icon(
              _getIcon(status),
              color: _getColor(status),
              size: 25.r,
            ),
            title: Text(title),
            subtitle: Text(
              message,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(c);
                    action?.call();
                  },
                  child: const Text("Tamam"))
            ],
          );
        });
  }

  void showAlertDialog(String title, String message,
      {MessageStatus status = MessageStatus.success,
      Function? done,
      Function? cancel}) {
    showDialog(
        context: this,
        builder: (c) {
          return AppDialog(
            icon: Icon(
              _getIcon(status),
              color: _getColor(status),
              size: 25.r,
            ),
            title: Text(title),
            subtitle: Text(
              message,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(c);
                    done?.call();
                  },
                  child: Text(c.appLocalizations.okay)),
              TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(c);
                    cancel?.call();
                  },
                  child: Text(c.appLocalizations.cancel))
            ],
          );
        });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnacbar(
    String message, {
    SnackBarAction? action,
    SnackBarDuration duration = SnackBarDuration.long,
    MessageStatus status = MessageStatus.success,
  }) {
    final s = ScaffoldMessenger.of(this);
    //  s.hideCurrentSnackBar();
    // s.clearSnackBars();
    return s.showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Row(
        children: [
          Icon(
            _getIcon(status),
            color: Colors.white,
            size: 25.r,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DefaultTextStyle(
                style: AppTextStyle.bodyRegular.copyWith(color: Colors.white),
                child: Text(
                  message.toString().trim().first100,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: _getColor(status),
      duration: _getTime(duration),
      action: action,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
  }
}

extension _StringEx on String {
  String get first100 {
    if (length > 100) {
      return substring(0, 100);
    }
    return this;
  }
}
