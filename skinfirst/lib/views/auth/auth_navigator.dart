import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/views/auth/login/login_view.dart';
import 'package:skinfirst/views/auth/signup/signup_view.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image(
              image: AssetImage(appLogo),
              height: MediaQuery.of(context).size.height * 0.35,
             ),

             const SizedBox(height: 8,),

             const Text("Dermatology Center", style: TextStyle(
              color: appTheme,
              fontWeight: FontWeight.bold,
              fontSize: 12
             ),),

             const SizedBox(height: 38,),

             SizedBox(
               width: MediaQuery.of(context).size.width * 0.5,
               child: CustomButton(
                title: "Log In", 
                buttonColor: appTheme, 
                textColor: Color.fromRGBO(255, 255, 255, 1),
                onClick: () {
                  Get.to(LoginView(), transition: Transition.leftToRight);
                }
               ),
             ),

             SizedBox(
               width: MediaQuery.of(context).size.width * 0.5,
               child: CustomButton(
                title: "Sign Up", 
                buttonColor: subTheme, 
                textColor: appTheme,
                onClick: () {
                  Get.to(SignupView(), transition: Transition.leftToRight);
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