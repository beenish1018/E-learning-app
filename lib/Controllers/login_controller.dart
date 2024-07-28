import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/apiServices.dart';
import '../models/user_model.dart';
import 'package:coursera/Constants/Color.dart' as color;

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService apiService = ApiService(); 
  RxBool isPasswordVisible = false.obs;

  Future<void> login() async {
    try {
      String username = emailController.text;
      String password = passwordController.text;

      String? loggedIn = await apiService.login(User(username: username, password: password));

      if (loggedIn != null) {
        Get.offNamed('/dashboard'); 
      } else {
        Get.snackbar(
          'Login failed',
          'Invalid username or password',
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error: $e',
        duration: Duration(seconds: 3),
        colorText: color.Colors.primary,
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
