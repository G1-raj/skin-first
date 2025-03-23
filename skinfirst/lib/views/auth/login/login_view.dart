import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back_ios, color: appTheme,
          )),
          title: Text("Log In", style: TextStyle(
            color: appTheme,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
            
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: const Text("Welcome", style: TextStyle(
                        color: appTheme,
                        fontSize: 32,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
            
                  const SizedBox(height: 28,),
            
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: const Text("Email or Mobile Number", style: TextStyle(
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
                      title: "email or phone", 
                      textController: emailController
                    ),
                  ),
            
                  const SizedBox(height: 22,),
            
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
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
            
                  const SizedBox(height: 8,),
            
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed("/forgot_password");
                        }, 
                        child: Text("Forget Password", style: TextStyle(
                          color: appTheme,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),)
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 12,),
            
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomButton(
                      title: "Log In", 
                      buttonColor: appTheme, 
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      onClick: () {
                        // Get.offAllNamed("/home");
                        if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          _authController.logInController(emailController.text, passController.text);

                          emailController.clear();
                          passController.clear();
                        }
                      }
                    ),
                  ),
            
                  const SizedBox(height: 12,),
            
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(width: 2,),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/signup");
                        }, 
                        child: Text("Sign up", style: TextStyle(color: appTheme),)
                      )
                    ],
                  ),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}