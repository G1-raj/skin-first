import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Obx(
                  () {

                    if(_authController.user.value == null) {
                      return CircularProgressIndicator(color: appTheme,);
                    }


                    return CircleAvatar(
                      radius: 65,
                      backgroundImage: _authController.user.value!.profilePicture == null ? 
                                      AssetImage(personMascot) :  NetworkImage(_authController.user.value?.profilePicture ?? ""),
                    );
                  }
                ),
                const SizedBox(height: 7),
                Obx(
                  () {

                    if(_authController.user.value == null) {
                      return CircularProgressIndicator();
                    }

                    fullNameController.text = _authController.user.value!.fullName;
                    emailController.text = _authController.user.value!.email;
                    phoneController.text = _authController.user.value!.phoneNo;

                    return Text(
                      _authController.user.value?.fullName ?? "Loading name....",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 21),
                    );
                  }
                ),
                const SizedBox(height: 20),
          
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: const Text("Full Name", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
          
                  const SizedBox(height: 15,),
          
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomInputField(
                      title: "Name", 
                      textController: fullNameController
                    ),
                  ),
          
                  const SizedBox(height: 15,),
          
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: const Text("Email", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
          
                  const SizedBox(height: 15,),
          
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomInputField(
                      title: "Email", 
                      textController: emailController
                    ),
                  ),
          
                  const SizedBox(height: 22,),
          
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: const Text("Phone Number", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
          
                  const SizedBox(height: 15,),
          
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomInputField(
                      title: "Phone Number", 
                      textController: phoneController
                    ),
                  ),
          
                  const SizedBox(height: 25,),
          
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomButton(
                      title: "Update Profile", 
                      buttonColor: appTheme, 
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      onClick: () {
                        Get.back();
                      }
                    ),
                  ),
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}