// time_box.dart
import 'package:flutter/material.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/Constants/text_styles.dart';

Widget getTimeBoxUI(String text1, String txt2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: color.Colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: color.Colors.secondary.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 12.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyles.tabTitle,
            ),
            Text(
              txt2,
              textAlign: TextAlign.center,
              style: TextStyles.overviewItemSubtitle,
            ),
          ],
        ),
      ),
    ),
  );
}
