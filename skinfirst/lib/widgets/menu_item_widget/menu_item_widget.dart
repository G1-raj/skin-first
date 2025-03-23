import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color backgroundColor;
  final bool showTrailing;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.grey,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: backgroundColor,
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        trailing: showTrailing ? Icon(Icons.arrow_forward_ios, color: backgroundColor) : null,
      ),
    );
  }
}
