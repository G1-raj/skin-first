import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final AuthController _authController = Get.put(AuthController());
  String? profileImage;

  void pickImage() async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image != null) {
        setState(() {
          profileImage = image.path;
        });

       if(_authController.user.value != null) {
        _authController.uploadImageController(_authController.user.value!.id, profileImage!);
       } 
      }
      
    } catch (e) {
      throw Exception("Failed to get your image");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.person_2_outlined,
        "title": "Profile",
        "onTap": () => Get.toNamed("/edit_profile"),
      },
      {
        "icon": Icons.favorite_outline,
        "title": "Favourite",
        "onTap": () => print("Favourite tapped"),
      },
      {
        "icon": Icons.wallet_outlined,
        "title": "Payment Method",
        "onTap": () => print("Payment Method tapped"),
      },
      {
        "icon": Icons.lock_outline,
        "title": "Privacy Policy",
        "onTap": () => print("Privacy Policy tapped"),
      },
      {
        "icon": Icons.settings_outlined,
        "title": "Settings",
        "onTap": () => Get.toNamed("/settings"),
      },
      {
        "icon": Icons.help_outline,
        "title": "Help",
        "onTap": () => print("Help tapped"),
      },
      {
        "icon": Icons.logout_outlined,
        "title": "Log Out",
        "onTap": () {
            Get.bottomSheet(
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // ✅ Prevents unnecessary stretching
                    children: [
                      const Text(
                        "Logout",
                        style: TextStyle(color: appTheme, fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 18),

                      const Text(
                        "Are you sure you want to log out?",
                        textAlign: TextAlign.center, // ✅ Centers the text properly
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisSize: MainAxisSize.min, // ✅ Prevents stretching beyond needed space
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: "Cancel",
                              buttonColor: subTheme,
                              textColor: appTheme,
                              onClick: () {
                                Get.back();
                              },
                            ),
                          ),
                          const SizedBox(width: 12), // ✅ Adds proper spacing

                          Expanded(
                            child: CustomButton(
                              title: "Logout",
                              buttonColor: appTheme,
                              textColor: subTheme,
                              onClick: () {
                                _authController.logOutController();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              barrierColor: Color.fromRGBO(34, 96, 255, 0.3),
              isDismissible: true
            );
        },
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "My Profile",
            style: TextStyle(color: appTheme, fontWeight: FontWeight.w600),
          ),
          centerTitle: true
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Column(
              children: [
                Obx(
                  () {

                    if(_authController.user.value == null) {
                      return CircularProgressIndicator(color: appTheme,);
                    }


                    return GestureDetector(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 65,
                        // backgroundImage: profileImage == null ? AssetImage(personMascot) : FileImage(File(profileImage!)) as ImageProvider,
                        backgroundImage: _authController.user.value!.profilePicture == null ? 
                                        (profileImage == null ? AssetImage(personMascot) : FileImage(File(profileImage!)) as ImageProvider) 
                                        : NetworkImage(_authController.user.value?.profilePicture ?? ""),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 7),
                Obx(
                  () {

                    if(_authController.user.value == null) {
                      return Text("Loading...");
                    }


                    return Text(
                      _authController.user.value?.fullName ?? "No Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 21),
                    );
                  }
                ),
                const SizedBox(height: 20),
              ],
            ),
            ...menuItems.map((item) => _buildMenuItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
      child: ListTile(
        onTap: item["onTap"], // Now onTap function is passed dynamically
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: subTheme,
          child: Icon(item["icon"], color: appTheme),
        ),
        title: Text(
          item["title"],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        trailing: item["title"] == "Log Out"
            ? null
            : Icon(Icons.arrow_forward_ios, color: subTheme),
      ),
    );
  }
}
