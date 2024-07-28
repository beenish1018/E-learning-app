import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coursera/constants/text_styles.dart';
import 'package:coursera/widgets/btn.dart';
import '../controllers/login_controller.dart';
import 'package:coursera/widgets/textfield.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/loginvector.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyles.loginTitle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Learn and enjoy the latest courses',
                      style: TextStyles.loginSubtitle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    prefixIcon: Icons.email,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        controller.emailController.clear();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomTextField(
                        controller: controller.passwordController,
                        label: 'Password',
                        obscureText: !controller.isPasswordVisible.value,
                        prefixIcon: Icons.lock,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      )),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {
                      controller.login();
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
