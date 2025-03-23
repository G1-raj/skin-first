import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/widgets/search_bar_widget/search_bar_widget.dart';

class HeadAppBar extends StatelessWidget implements PreferredSizeWidget {
  HeadAppBar({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
        children: [
          // Profile & Notification Row
          Row(
            children: [
              Obx(
                () {

                  if(_authController.user.value == null) {
                    return CircularProgressIndicator(color:  appTheme,);
                  }


                  return CircleAvatar(
                    radius: 28,
                    backgroundImage: _authController.user.value!.profilePicture == null ?
                     AssetImage(personMascot) : NetworkImage(_authController.user.value!.profilePicture!)
                  );
                }
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "Hi, Welcome back",
                    style: TextStyle(color: appTheme, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () {

                      if(_authController.user.value == null) {
                        return Text("wait....");
                      }


                      return Text(_authController.user.value!.fullName, style: TextStyle(fontSize: 16));
                    }
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: appTheme),
                onPressed: () => Get.toNamed("/notification"),
              ),
              IconButton(
                icon: Icon(Icons.settings_outlined, color: appTheme),
                onPressed: () => Get.toNamed("/settings"),
              ),
            ],
          ),
          const SizedBox(height: 25),
          // Doctor & Favorite + Search Bar
          Row(
            children: [
              _buildIconButton(
                icon: Icons.medical_information_outlined,
                label: "Doctor",
                onTap: () => Get.toNamed("/doctor_list"),
              ),
              const SizedBox(width: 16),
              _buildIconButton(
                icon: Icons.favorite_outline_outlined,
                label: "Favourite",
                onTap: () {}, // Add function
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40, // Fixed height for consistency
                child: SearchBarWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function for icon buttons
  Widget _buildIconButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: subTheme,
            child: Icon(icon, color: appTheme),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: appTheme, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120); // Adjust height if needed
}
