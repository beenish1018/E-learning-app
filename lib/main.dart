import 'package:coursera/View/detailed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/splashscreen.dart';
import 'view/login.dart';
import 'view/home.dart';
import 'view/dashboard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Learning App',
      home: AuthenticationWrapper(),
      initialRoute: '/splashscreen',
      getPages: [
        GetPage(name: '/splashscreen', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/dashboard', page: () => DashboardView()),
        GetPage(name: '/detailed', page: () => CourseDetailsScreen()),
      ],
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    bool isAuthenticated = true; 

    // ignore: dead_code
    return isAuthenticated ? HomeView() : LoginView();
  }
}
