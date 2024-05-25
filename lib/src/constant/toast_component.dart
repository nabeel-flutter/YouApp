import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:your_app_test/src/theme/palette.dart';

class ToastComponent2 {
  final BuildContext context;
  static late FToast _fToast;

  ToastComponent2(this.context) {
    _fToast = FToast().init(context);
  }

  void removeQueuedToasts() {
    _fToast.removeQueuedCustomToasts();
  }

  void showToast(
    BuildContext context,
    String message, {
    bool makeToastPositionBottom = false,
    bool extendDurationTime = false,
  }) {
    final Widget toast = Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: makeToastPositionBottom ? 34 : 12,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Palette.primaryColor),
          color: Palette.widgetBgColor.withOpacity(0.6),
        ),
        // width: MediaQuery.of(context).size.width * .9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.info,
                  color: Palette.primaryColor,
                ),
                SizedBox(width: 12),
              ],
            ),
            Flexible(
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Palette.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: makeToastPositionBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      toastDuration: Duration(seconds: extendDurationTime ? 5 : 3),
    );
  }
}

class ToastComponent3 {
  final BuildContext context;
  static late FToast _fToast;

  ToastComponent3(this.context) {
    _fToast = FToast().init(context);
  }

  void removeQueuedToasts() {
    _fToast.removeQueuedCustomToasts();
  }

  void showToast(
    BuildContext context,
    String message, {
    bool makeToastPositionBottom = false,
    bool extendDurationTime = false,
  }) {
    final Widget toast = Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: makeToastPositionBottom ? 34 : 12,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Palette.redIndicatorColor),
          color: Palette.redIndicatorColor.withOpacity(0.5),
        ),
        // width: MediaQuery.of(context).size.width * .9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.info,
                  color: Palette.redIndicatorColor,
                ),
                SizedBox(width: 12),
              ],
            ),
            Flexible(
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Palette.redIndicatorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: makeToastPositionBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      toastDuration: Duration(seconds: extendDurationTime ? 5 : 3),
    );
  }
}
