import 'package:get/get.dart';

class DashboardController extends GetxController {
 final List<Map<String, dynamic>> categories = [
    {
      'name': 'Web App',
      'courses': '10'
    },
    {
      'name': 'UI/UX',
      'courses': '10'
    },
    {
      'name': 'Graphic Design',
      'courses': '10'
    },
    {
      'name': 'Mobile App',
      'courses': '10'
    },
    {
      'name': 'Machine Learning',
      'courses': '10'
    },
  ];
final List<Map<String, dynamic>> lectures = [
    {
      'cousreId':'1',
       'lectures': [
      'https://youtu.be/1gDhl4leEzA?si=JZZyyitdNmFRL3wZ',
      'https://youtu.be/jqxz7QvdWk8?si=Mll36W-7hecDhLGJ',
    ]
    },
    {
      'cousreId':'2',
       'lectures': [
      'https://youtu.be/1gDhl4leEzA?si=JZZyyitdNmFRL3wZ',
      'https://youtu.be/jqxz7QvdWk8?si=Mll36W-7hecDhLGJ',
    ]
    },
    {
      'cousreId':'3',
       'lectures': [
      'https://youtu.be/1gDhl4leEzA?si=JZZyyitdNmFRL3wZ',
      'https://youtu.be/jqxz7QvdWk8?si=Mll36W-7hecDhLGJ',
    ]
    },
    {
      'cousreId':'4',
       'lectures': [
      'https://youtu.be/1gDhl4leEzA?si=JZZyyitdNmFRL3wZ',
      'https://youtu.be/jqxz7QvdWk8?si=Mll36W-7hecDhLGJ',
    ]
    },
  ];
  final List<Map<String, dynamic>> topCourses = [
    {
      'courseId': '1',
      'title': 'Flutter Course',
      'image': 'assets/image6.png',
      'rating': 4.5,
      'students': 1200,
      'level' : 'Beginner',
      'url': 'view/detailed',
      'followers': '10,1000',
      'ratings':'4.5',
      'duration' : '3 hrs',
      'certificate' : true,
      'Description' : 'Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. '
    },
    {
      'courseId': '2',
      'title': 'AI Guide',
      'image': 'assets/image2.png',
      'rating': 4.2,
      'students': 850,
      'url': 'view/detailed',
       'followers': '1010',
       'ratings':'4.5',
       'duration' : '3 hrs',
        'certificate' :'yes'
    },
    {
      'courseId': '3',
      'title': 'Website Development',
      'image': 'assets/image8.png',
      'rating': 4.2,
      'students': 390,
      'url': 'view/detailed',
       'followers': '11000',
       'ratings':'4.5',
       'duration' : '3 hrs',
        'certificate' :'no'
    },
    {
      'courseId': '4',
      'title': 'Deep Learning',
      'image': 'assets/image7.png',
      'rating': 4.2,
      'students': 390,
      'url': 'view/detailed',
       'followers': '10,1000',
       'ratings':'4.8',
       'duration' : '4 hrs',
        'certificate' :'no'

    },
  ];
   void navigateToCourseScreen(String courseId) {
    Get.toNamed('/detailed', arguments: {'courseId': courseId});
  }
  }
