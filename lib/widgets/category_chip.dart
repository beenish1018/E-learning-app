import 'package:flutter/material.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/constants/text_styles.dart';
class CategoryChip extends StatelessWidget {
  final String name;
  final int courses; 

  CategoryChip({required this.name, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyles.primary,
            ),
            Text(
              '($courses courses)',
              style: TextStyles.primary,
            ),
          ],
        ),
        backgroundColor: color.Colors.primary,
        elevation: 2,
        shadowColor: color.Colors.primary,
      ),
    );
  }
}
