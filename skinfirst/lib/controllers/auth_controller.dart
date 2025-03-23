import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:skinfirst/models/user.dart';
import 'package:skinfirst/services/auth_service.dart';

class AuthController extends GetxController {

  var user = Rxn<User>();
  RxString token = "".obs;
  RxBool isLoggedIn = false.obs;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();

    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final checkToken = await _storage.read(key: "token");
    final userData = await _storage.read(key: "skinfirstuser");

    if(checkToken != null && userData != null) {
      token.value = checkToken;
      final Map<String, dynamic> parsedUserData = jsonDecode(userData);
      user.value = User.fromJson(parsedUserData);
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }



  Future<void> signUpController(String fullName, String email, String phoneNo, String password) async {
    try {

      var result = await AuthService().signUp(fullName, email, phoneNo, password);

      if(!result.isSuccess) {
        Get.snackbar("Error", result.errorResponse!.message);
        return;
      }

      var signupResponse = result.authenticationResponse;

      if(signupResponse == null) {
        throw Exception("Failed to create user");
      }

      Get.back();

      Get.snackbar("Success", "User created successfully");
      
    } catch (e) {
      throw Exception("Failed to create user and error is in signup controller and error is: $e");
    }
  }

  Future<void> uploadImageController(String patientId, String profilePicture) async {
    try {

      var result = await AuthService().uploadProfileImageService(patientId, profilePicture);

      if(!result.isSuccess) {
        Get.snackbar("Error", "Failed to upload image please retry");
      }

      var response = result.authenticationResponse;

      if(response == null) {
        throw Exception("Failed to fetch response");
      }

      user.value = response.data;


      if (user.value != null) {
      try {
        await _storage.write(key: "skinfirstuser", value: jsonEncode(user.value!.toJson()));
      } catch (storageError) {
        throw Exception("Failed to update secure storage: $storageError");
      }
    }

    Get.snackbar("Success", "Picture updated successfully");

      
      
    } catch (e) {
      throw Exception("Failed to upload user profile and error is in upload profile controller and error is: $e");
    }
  }

  Future<void> logInController(String email, String password) async {
    try {

      var result = await AuthService().logIn(email, password);

      if(!result.isSuccess) {
        Get.snackbar("Error", result.errorResponse!.message);
        return;
      }

      var loginresponse = result.authenticationResponse;

      if(loginresponse == null) {
         throw Exception("Failed to fetch user");
      }

      user.value = loginresponse.data;
      token.value = loginresponse.token!;

      if(user.value == null) {
         throw Exception("Failed to fetch user");
      }

      await _storage.write(key: "token", value: token.value);
      await _storage.write(key: "skinfirstuser", value: jsonEncode(user.value!.toJson()));

      isLoggedIn.value = true;

      Get.offAllNamed("/home");

      Get.snackbar("Success", "Login Successful");
      
    } catch (e) {
      throw Exception("Failed to create user and error is in login controller error is: $e");
    }
  }

  Future<void> logOutController() async {

    await _storage.delete(key: "token");
    await _storage.delete(key: "skinfirstuser");

    await _storage.deleteAll();

    Get.offAllNamed("/auth_navigator");

  }
}