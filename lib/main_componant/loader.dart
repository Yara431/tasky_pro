import 'package:flutter/material.dart';
import 'package:tasky_pro/app_context_extension.dart';

class LoaderApp {
  static Future<void> showLoadingDialog(BuildContext context,) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (BuildContext context){
          return Dialog(
            backgroundColor: context.resources.color.colorWhite,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.resources.dimensions.mediumRadius8)
            ),
            shadowColor:  context.resources.color.colorPrimary,
            elevation: 0,
            child: Padding(padding: EdgeInsets.all(context.resources.dimensions.defaultPadding85),
            child: SizedBox(
              height:  MediaQuery.of(context).size.height/6,
              child: Center(
                child: SizedBox(
                  height: context.resources.dimensions.defaultPadding85,
                  width: context.resources.dimensions.defaultPadding85,
                  child: CircularProgressIndicator(
                    strokeWidth: context.resources.dimensions.padding8,
                    backgroundColor: Colors.transparent,
                    color: context.resources.color.colorPrimary,
                  ),
                ),
              ),
            ),
            ),
          );
        });
  }
}