import 'package:flutter/material.dart';
import 'package:getxdemo/utils/constants/Dimens.dart';
import 'package:getxdemo/utils/styles/colors.dart';

roundedBorder(
    {radius = Dimens.cornorRadius, borderColor = ColorsDefault.borderColor, borderWidth = 1.0}) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: BorderSide(color: borderColor, width: borderWidth));
}
inputBorderAll(
    {width = 1.0, radius = Dimens.cornorRadius, color = ColorsDefault.borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    borderSide: BorderSide(color: color, width: width),
  );
}
