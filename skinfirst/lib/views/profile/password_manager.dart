import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';

class PasswordManager extends StatelessWidget {
  PasswordManager({super.key});

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController cnfNewPassController = TextEditingController();

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
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 35,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: const Text("Current Password", style: TextStyle(
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
                  title: "Password", 
                  textController: oldPassController,
                  hidePassword: true,
                ),
              ),
      
              const SizedBox(height: 15,),
      
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: const Text("New Password", style: TextStyle(
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
                  title: "New Password", 
                  textController: newPassController,
                   hidePassword: true,
                ),
              ),
      
              const SizedBox(height: 22,),
      
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: const Text("Confirm New Passowrd", style: TextStyle(
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
                  title: "Re-Type New Password", 
                  textController: cnfNewPassController,
                  hidePassword: true,
                ),
              ),
      
              const SizedBox(height: 25,),
      
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomButton(
                  title: "Change Password", 
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
    );
  }
}