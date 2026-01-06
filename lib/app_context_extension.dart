import 'package:flutter/material.dart';
import 'package:tasky_pro/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}