import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/models/error_response_model.dart';
import 'package:skinfirst/models/response_model.dart';
import 'package:skinfirst/models/user_model.dart';

class AuthService {

  Future<ResponseModel> signUp(String fullName, String email, String phoneNo, String password) async {
    try {

      var signupUrl = Uri.parse(signup);
      var response = await http.post(signupUrl, body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "phoneNo": phoneNo,
          "password": password
        }),

        headers: {
           "Accept": "application/json",
           "Content-Type": "application/json",
        }
      
      );

      var responseBody = jsonDecode(response.body);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(responseBody));
      }

      return ResponseModel.success(UserModel.fromJson(responseBody));
      
    } catch (e) {
      throw Exception("Failed to create user and error is in signup service error is: $e");
    }
  }

  Future<ResponseModel> uploadProfileImageService(String patientId, String profilePicture) async {
    try {

      var url = Uri.parse(uploadProfile(patientId));
      var request = http.MultipartRequest("PATCH", url);
      request.fields['profilePicture'] = profilePicture;

      request.files.add(await http.MultipartFile.fromPath('profilePicture', profilePicture));
      
      var response = await request.send();

      var responseData = await response.stream.bytesToString();
      var serialized = jsonDecode(responseData);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(serialized));
      }
      

      return ResponseModel.success(UserModel.fromJson(serialized));


      
    } catch (e) {
      throw Exception("Failed to upload user profile picture and error is in uploadProfileImage service and error is: $e");
    }
  }

  Future<ResponseModel> logIn(String email, String password) async {
    try {

      var loginUrl = Uri.parse(login);
      var response = await http.post(loginUrl, body: jsonEncode({
          "email": email,
          "password": password
        }), 

        headers: {
           "Accept": "application/json",
           "Content-Type": "application/json",
        }
      );

      var respndeBody = jsonDecode(response.body);

      if(response.statusCode != 200) {
        return ResponseModel.error(ErrorResponseModel.fromJson(respndeBody));
      }

      return ResponseModel.success(UserModel.fromJson(respndeBody));
      
    } catch (e) {
      throw Exception("Failed to create user and error is in signup service error is: $e");
    }
  }



}