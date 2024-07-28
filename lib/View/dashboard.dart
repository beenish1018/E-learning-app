import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coursera/Controllers/DashboardController.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/constants/text_styles.dart';
import 'package:coursera/constants/images.dart';
import 'package:coursera/view/sidebar.dart';
import 'package:coursera/widgets/category_chip.dart';
import 'package:coursera/widgets/course_card.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    const String userName = "Beenish Ali";
    const String userEmail = "beenishali@gmail.com";
    const String userProfileImage = "assets/loginvector.jpg";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyles.appBarTitle,
        ),
        backgroundColor: color.Colors.primary,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: color.Colors.icons,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: color.Colors.icons,
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      drawer: SidebarDrawer(
        onItemSelected: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/dashboard');
              break;
            case 1:
              // Handle Machine Learning courses
              break;
            case 2:
              // Handle UI/UX courses
              break;
          }
        },
        userName: userName,
        userEmail: userEmail,
        userProfileImage: userProfileImage,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 700,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                  ),
                  items: AppImages.imagePaths.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyles.sectionTitle,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      final int courseCount =
                          int.tryParse(category['courses']) ??
                              0; 

                      return CategoryChip(
                        name: category['name'],
                        courses: courseCount,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Top Courses',
                  style: TextStyles.sectionTitle,
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: controller.topCourses.length,
                itemBuilder: (context, index) {
                  final course = controller.topCourses[index];

                  return 
                      CourseCard(
                    image: course['image'],
                    title: course['title'],
                    rating: course['rating'].toString(),
                    students: course['students'],
                    courseId: course['courseId'],
                    onTap: () {
                      print('Navigating to course ID: ${course['courseId']}');
                      Get.toNamed('/detailed',
                          arguments: {'courseId': course['courseId']});
                    },
                    height: 120.0, 
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
