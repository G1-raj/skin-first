import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/controllers/connectivity_controller.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final AuthController _authController = Get.put(AuthController());
  final ConnectivityController _connectivityController = Get.put(ConnectivityController());

  @override
  void initState() {
    super.initState();

    _connectivityController.checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
      body: Obx(
       () {

        if(_connectivityController.isConnected.value) {
          Future.delayed(Duration(seconds: 1), () {
              _authController.checkLoginStatus().then((_) {
                  if(_authController.isLoggedIn.value) {
                    Get.offAllNamed("/home");
                  } else {
                    Get.offAllNamed("/auth_navigator");
                  }
                });
            });

            return Center(
              child: CircularProgressIndicator(
                color: appTheme,
              ),
            );
          } else {
            return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No internet connection'),
                ElevatedButton(
                  onPressed: () {
                    _connectivityController.checkConnectivity(); 
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          );
          }
        }
      ),
    );
  }
}