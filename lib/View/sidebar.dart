import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coursera/Constants/Color.dart' as color;
import 'package:coursera/widgets/side_menu_item.dart'; 

class SidebarDrawer extends StatelessWidget {
  final void Function(int) onItemSelected;
  final String userName;
  final String userEmail;
  final String userProfileImage;

  const SidebarDrawer({
    Key? key,
    required this.onItemSelected,
    required this.userName,
    required this.userEmail,
    required this.userProfileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userProfileImage),
              radius: 30,
            ),
            decoration: BoxDecoration(
              color: color.Colors.primary,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SideMenuItem(
                  title: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: (index, _) {
                    onItemSelected(0);
                  },
                ),
                SideMenuExpansionItem(
                  title: "Courses",
                  icon: const Icon(Icons.kitchen),
                  children: [
                    SideMenuItem(
                      title: 'Machine Learning',
                      icon: const Icon(Icons.home),
                      onTap: (index, _) {
                        onItemSelected(1);
                      },
                    ),
                    SideMenuItem(
                      title: 'UI/UX',
                      icon: const Icon(Icons.supervisor_account),
                      onTap: (index, _) {
                        onItemSelected(2);
                      },
                    ),
                  ],
                ),
                SideMenuItem(
                  title: 'Logout',
                  icon: const Icon(Icons.exit_to_app),
                  onTap: (index, _) {
                    Get.offAllNamed('/login'); 
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
