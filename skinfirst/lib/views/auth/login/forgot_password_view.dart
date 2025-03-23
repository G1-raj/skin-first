import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/views/auth/auth_navigator.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final TextEditingController passController = TextEditingController();
  final TextEditingController cnfPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back_ios, color: appTheme,
          )),
          title: Text("Set Password", style: TextStyle(
            color: appTheme,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 38),
                      child: const Text("Password", style: TextStyle(
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
                      textController: passController,
                      hidePassword: true,
                    ),
                  ),
          
                  // const SizedBox(height: 9,),
          
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 38),
                      child: const Text("Confirm Password", style: TextStyle(
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
                      textController: cnfPassController,
                      hidePassword: true,
                    ),
                  ),

                  const SizedBox(height: 15,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomButton(
                      title: "Set Password", 
                      buttonColor: appTheme, 
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      onClick: () {
                        Get.offAll(AuthNavigator(), transition: Transition.rightToLeft);
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