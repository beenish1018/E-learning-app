// lib/widgets/course_card.dart
import 'package:flutter/material.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/constants/text_styles.dart';

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final int students;
  final String courseId;
  final VoidCallback onTap;
  final double height; // Make height a required property

  const CourseCard({
    required this.image,
    required this.title,
    required this.rating,
    required this.students,
    required this.courseId,
    required this.onTap,
    this.height = 120.0, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color.Colors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.7, 
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.courseTitle,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '$students students enrolled',
                      style: TextStyles.primary2,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: color.Colors.stars, size: 16),
                        const SizedBox(width: 5),
                        Text(rating, style: TextStyles.courseRating),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
