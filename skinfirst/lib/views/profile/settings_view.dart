import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/menu_item_widget/menu_item_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: appTheme, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: appTheme),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),

        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 18,),
              MenuItemWidget(
                icon: Icons.notifications_outlined, 
                iconColor: appTheme,
                backgroundColor: subTheme,
                title: "Notification Settings",
                onTap: () => Get.toNamed("/notification_settings"),
              ),

              const SizedBox(height: 12,),

              MenuItemWidget(
                icon: Icons.key_outlined, 
                iconColor: appTheme,
                backgroundColor: subTheme,
                title: "Password Manager",
                onTap: () => Get.toNamed("/password_manager"),
              ),
              const SizedBox(height: 12,),

              MenuItemWidget(
                icon: Icons.person_outlined, 
                iconColor: appTheme,
                backgroundColor: subTheme,
                title: "Delete Account",
                onTap: () {
                  Get.offAllNamed("/auth_navigator");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}