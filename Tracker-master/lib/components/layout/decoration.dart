import 'package:tracker/components/util/screen_util.dart';
import 'package:flutter/material.dart';

BoxDecoration getDecoration({Color color}) {
  return BoxDecoration(
      color: color,
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * .6)));
}
