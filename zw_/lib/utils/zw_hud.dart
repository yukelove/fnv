import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:zw_/config/font_config/font_config.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/utils/progress_dialog.dart';

class ZWHud {

    static void showLoading(String text, {int duration = 10, bool needBarrier =true}) {
    dismissLoadig();
    BotToast.showCustomLoading(
      backgroundColor: Colors.white.withOpacity(0),
      allowClick: !needBarrier,
      align: Alignment.center,
      toastBuilder: (_) {
        return Container(
          child: ProgressDialog(hintText: text),
        );
      },
      duration: Duration(seconds: duration),
    );
  }


  ///显示文本
  static void showText(String text, {int milliseconds = 2 * 1000, bool needBarrier=true}) {
    dismissLoadig();
    BotToast.showCustomLoading(
      backgroundColor: Colors.transparent,
      allowClick: !needBarrier,
      toastBuilder: (_) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              color: Color.fromRGBO(0, 0, 0, 0.7),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: FontRes.font_sp16, color: Colors.white)),
              ),
            ));
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }


  static void dismissLoadig() {
    BotToast.closeAllLoading();
  }
}