import 'package:flutter/material.dart';
import 'Color.dart' as color;

class TextStyles {

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    color: color.Colors.appbar,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static const TextStyle primary = TextStyle(
    color: color.Colors.categorytext,
    fontSize: 13,
  );

  static const TextStyle primary2 = TextStyle(
    color: color.Colors.text,
    fontSize: 16,
  );

  static const TextStyle courseTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle tabTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overviewSectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overviewItemTitle = TextStyle(
    fontSize: 16,
  );

  static const TextStyle overviewItemSubtitle = primary2;

  static const TextStyle courseRating = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle studentsEnrolled = primary2.copyWith(
    fontSize: 14,
  );

  static const TextStyle loginTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: color.Colors.primary,
  );

  static const TextStyle loginSubtitle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color.Colors.primary,
  );

  static const TextStyle regularText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
