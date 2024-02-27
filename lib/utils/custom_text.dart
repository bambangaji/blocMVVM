import 'package:flutter/material.dart';
import 'package:merchant_senbu/utils/color_custom.dart';

Text titleText(String Content,
    {Color textColor = Warna.hitam,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    Content,
    overflow: TextOverflow.ellipsis,
    style:
        TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize),
  );
}

Text longText(String Content,
    {Color textColor = Warna.hitam, double fontSize = 14}) {
  return Text(
    Content,
    softWrap: true,
    textAlign: TextAlign.justify,
    style: TextStyle(
        height: 1.3,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: fontSize),
  );
}
