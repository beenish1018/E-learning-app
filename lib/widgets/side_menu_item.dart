// side_menu_item.dart
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function(int, BuildContext) onTap;

  const SideMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        onTap(0, context); 
      },
    );
  }
}

class SideMenuExpansionItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final List<SideMenuItem> children;

  const SideMenuExpansionItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: icon,
      title: Text(title),
      children: children,
    );
  }
}
