/*
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:egaragi/resources/app_context_extension.dart';
import 'package:flutter/material.dart';

class ToastMassages {
  //change the res later

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.easeInOut,
          message: message,
          barBlur: 5,
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: context.resources.color.colorRed,
          icon: const Icon(Icons.error_outline, color: Colors.white),
          isDismissible: true,
          messageText: Text(
            message,
            style: TextStyle(
                color: context.resources.color.colorWhite,
                fontSize: context.resources.dimension.text14),
            textAlign: TextAlign.center,
          ),
          borderRadius:
          BorderRadius.circular(context.resources.dimension.defaultMargin),
          margin: EdgeInsets.symmetric(
              horizontal: context.resources.dimension.defaultMargin),
          duration: const Duration(seconds: 3),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: context.resources.dimension.defaultMargin,
        )..show(context));
  }

  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          barBlur: 5,
          forwardAnimationCurve: Curves.easeInOut,
          message: message,
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: context.resources.color.colorWhite),
          isDismissible: true,
          messageText: Text(
            message,
            style: TextStyle(
                color: context.resources.color.colorWhite,
                fontSize: context.resources.dimension.text14),
            textAlign: TextAlign.center,
          ),
          borderRadius:
          BorderRadius.circular(context.resources.dimension.defaultMargin),
          margin: EdgeInsets.symmetric(
              horizontal: context.resources.dimension.defaultMargin),
          duration: const Duration(seconds: 3),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: context.resources.dimension.defaultMargin,
        )..show(context));
  }
}*/
