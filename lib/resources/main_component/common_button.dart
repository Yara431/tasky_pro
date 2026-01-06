import 'package:flutter/material.dart';
import 'package:tasky_pro/app_context_extension.dart';
import 'package:tasky_pro/resources/text_style/text_styling.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  const CommonButton({super.key,this.onPress,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.resources.dimensions.padding8,
      vertical: context.resources.dimensions.padding12
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.resources.dimensions.mediumRadius8),
            color: context.resources.color.colorPrimary,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 5,
              color: context.resources.color.colorPrimary
            )
          ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.resources.color.colorSecondaryPrimary,
                  context.resources.color.colorPrimary
                ])
          ),
          child: Center(
            child: Text(text,
                style:TextStyling.semiBoldText14.copyWith(
                  fontSize: 20,
              color: Colors.white
            )),
          ),
        ),
      ),
    );
  }
}
