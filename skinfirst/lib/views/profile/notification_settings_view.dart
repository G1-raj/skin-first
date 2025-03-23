import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/settings_switch/settings_switch.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Password Manager",
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 35,),
                SettingsSwitch(
                  title: "General Notification",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
                SettingsSwitch(
                  title: "Sound",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
                SettingsSwitch(
                  title: "Sound Call",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
                SettingsSwitch(
                  title: "Vibrate",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
                SettingsSwitch(
                  title: "Special Offers",
                  initialValue: false,
                  onChanged: (value) {
                    
                  },
                ),
                SettingsSwitch(
                  title: "Payments",
                  initialValue: false,
                  onChanged: (value) {
                    
                  },
                ),
                SettingsSwitch(
                  title: "Promo And Discount",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
                SettingsSwitch(
                  title: "Cashback",
                  initialValue: false,
                  onChanged: (value) {
                   
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}