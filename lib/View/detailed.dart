import 'package:coursera/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/Constants/text_styles.dart';
import 'package:coursera/widgets/time_box.dart';
import 'package:coursera/Controllers/course_details_controller.dart';
import 'package:coursera/widgets/textfield.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CourseDetailsController controller = Get.put(CourseDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details', style: TextStyles.appBarTitle),
        backgroundColor: color.Colors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: color.Colors.icons),
        bottom: TabBar(
          controller: controller.tabController,
          labelColor: color.Colors.indicator,
          unselectedLabelColor: color.Colors.appbar,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Lectures'),
            Tab(text: 'Chats'),
          ],
        ),
      ),
      backgroundColor: color.Colors.background,
      body: SafeArea(
        child: GetX<CourseDetailsController>(
          builder: (_) {
            if (controller.course.isEmpty) {
              return const Center(
                child: Text('Course not found'),
              );
            }

            final course = controller.course;
            final double tempHeight = MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.width / 1.6) +
                24.0;

            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      '${course['image']}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                              minHeight: 364.0,
                              maxHeight: tempHeight > 364.0 ? tempHeight : 364.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 18, right: 16),
                                child: Text(
                                  course['title'] ?? 'Course Title',
                                  textAlign: TextAlign.left,
                                  style: TextStyles.courseTitle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 8, top: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${course['level'] ?? 'N/A'}',
                                      textAlign: TextAlign.left,
                                      style: TextStyles.studentsEnrolled,
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            course['rating'].toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyles.courseRating,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: color.Colors.primary,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Obx(() => AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: controller.opacity1.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: <Widget>[
                                      getTimeBoxUI(course['duration'] ?? 'N/A',
                                          'Duration'),
                                      getTimeBoxUI(
                                          course['students']?.toString() ?? 'N/A',
                                          'Students'),
                                      getTimeBoxUI(
                                          course['certificate'] == true
                                              ? 'Yes'
                                              : 'No',
                                          'Certificate'),
                                    ],
                                  ),
                                ),
                              )),
                              Obx(() => AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: controller.opacity2.value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 8, bottom: 8),
                                  child: Text(
                                    course['Description'] ??
                                        'No description available.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyles.overviewItemSubtitle,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      // Lectures Tab
                      const Center(
                        child: Text('Lectures content goes here'),
                      ),
                      // Chats Tab
                      Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(8),
                              children: const [
                                Text('messages show here'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: controller.messageController,
                                    label: 'Type your message',
                                    prefixIcon: Icons.message,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: controller.sendMessage,
                                  child: const Text('Send'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(() {
        return controller.showEnrollButton.value
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  text: 'Enroll Now',
                  onPressed: () {
                    controller.showRegistrationSuccess();
                  },
                ),
              )
            : SizedBox.shrink();
      }),
    );
  }
}
