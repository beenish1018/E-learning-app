import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coursera/Controllers/DashboardController.dart';
import 'package:coursera/Constants/Color.dart' as color;

class CourseDetailsController extends GetxController with SingleGetTickerProviderMixin {
  final DashboardController dashboardController = Get.put(DashboardController());
  var course = {}.obs;

  late TabController tabController;
  late AnimationController animationController;
  var showEnrollButton = true.obs;
  var opacity1 = 0.0.obs;
  var opacity2 = 0.0.obs;
  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments.containsKey('courseId')) {
      String courseId = arguments['courseId'];
      course.value = dashboardController.topCourses
          .firstWhereOrNull((c) => c['courseId'] == courseId) ?? {};
    }
    if (course.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.back();
      });
    }

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      showEnrollButton.value = tabController.index != 2;
    });

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _setData();
  }

  Future<void> _setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    opacity1.value = 1.0;
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    opacity2.value = 1.0;
  }

  void sendMessage() {
    final message = messageController.text;
    if (message.isNotEmpty) {
      print('Sending message: $message');
      messageController.clear();
    }
  }

  void showRegistrationSuccess() {
    Get.snackbar(
      'Success',
      'Successfully registered',
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.Colors.cardBackground,
      colorText: Colors.black,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    tabController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
