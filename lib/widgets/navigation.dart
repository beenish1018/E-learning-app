import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final Widget nextScreen;

  NavigationButton({required this.text, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => nextScreen);
      },
      child: Text(text),
    );
  }
}