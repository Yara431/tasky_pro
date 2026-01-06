import 'package:flutter/material.dart';
import 'package:tasky_pro/resources/colors/app_colors.dart';
import 'package:tasky_pro/resources/dimensions/app_dimension.dart';
import 'package:tasky_pro/resources/images/app_images_urls_.dart';

class Resources{
  final BuildContext context;

  Resources(this.context);

  AppColors get color {
    return AppColors();
  }

  AppImagesUrls get imagesUrls{
    return AppImagesUrls();
  }

  AppDimension get dimensions{
    return AppDimension();
  }


  static Resources of(BuildContext context){
    return Resources(context);
  }
}