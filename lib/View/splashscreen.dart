import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:coursera/Constants/Color.dart' as color;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6), () {
      Get.offAllNamed('/login'); 
    });

    return Scaffold(
      backgroundColor: color.Colors.primary, 
      body: Center(
        child: Image.asset('assets/logo.png'), 
      ),
    );
  }
}
