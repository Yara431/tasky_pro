import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class IconUtils {
  IconUtils._();

  static String imagePath(String path) => "assets/icons/$path.svg";

  static Widget getSvgImage(String res,
      {double? width, double? height, BoxFit? fit, Color? color}) {
    return SvgPicture.asset(
      imagePath(res),
      semanticsLabel: 'My SVG Picture',
      fit: fit ?? BoxFit.contain,
      height: height,
      colorFilter:
      color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      //color: color,
    );
  }

  static Widget getSvgImageFull(String res,
      {double? width, double? height, BoxFit? fit, Color? color}) {
    return SvgPicture.asset(
      res,
      width: width,
      height: height,
      colorFilter:
      color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      //color: color,
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load("assets/images/$path.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
