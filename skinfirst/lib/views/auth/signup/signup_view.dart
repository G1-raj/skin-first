import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/widgets/custom_button/custom_button.dart';
import 'package:skinfirst/widgets/custom_input_field/custom_input_field.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final  _formKey = GlobalKey<FormState>();

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
          title: Text("New Account", style: TextStyle(
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
            
                  const SizedBox(height: 28,),
            
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
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
                      padding: const EdgeInsets.only(left: 28.0),
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
                      padding: const EdgeInsets.only(left: 28.0),
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
            
                  const SizedBox(height: 15,),
            
            
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
            
                  const SizedBox(height: 15,),
            
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomButton(
                      title: "Sign up", 
                      buttonColor: appTheme, 
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      onClick: () {
                        // Get.to(LoginView(), transition: Transition.leftToRight);
                        // Get.back();

                        if(_formKey.currentState!.validate()) {

                         _formKey.currentState!.save();

                         _authController.signUpController(
                            fullNameController.text, 
                            emailController.text, 
                            phoneController.text, 
                            passController.text
                          );


                          fullNameController.clear();
                          emailController.clear();
                          phoneController.clear();
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
                      const Text("Already have an account?"),
                      const SizedBox(width: 2,),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/login");
                        }, 
                        child: Text("Log in", style: TextStyle(color: appTheme),)
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