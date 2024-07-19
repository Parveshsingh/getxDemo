import 'package:flutter/material.dart';
import '../constants/Dimens.dart';

semiBoldTextStyle(
    {color = Colors.black,
    fontSize = Dimens.dp14,
    fontWeight = FontWeight.w600}) {
  return TextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
}

boldTextStyle({color = Colors.black, fontSize = Dimens.dp14}) {
  return TextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
}

regularTextStyle(
    {fontWeight = FontWeight.w400,
    color = Colors.black,
    fontSize = Dimens.dp12,
    decoration = TextDecoration.none,
    fontStyle = FontStyle.normal}) {
  return TextStyle(
    fontStyle: fontStyle,
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
  );
}
