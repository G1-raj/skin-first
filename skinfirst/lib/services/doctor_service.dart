import 'dart:convert';
import 'package:skinfirst/constants.dart';
import 'package:http/http.dart' as http;
import 'package:skinfirst/models/all_doctor_model.dart';
import 'package:skinfirst/models/doctor_response_model.dart';
import 'package:skinfirst/models/error_response_model.dart';
import 'package:skinfirst/models/response_model.dart';

class DoctorService {
  Future<ResponseModel> getAllDoctorsService() async {
    try {

        var allDoctorsUrl = Uri.parse(getAllDoctors);
        var response = await http.get(allDoctorsUrl, headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        });

        var responseBody = jsonDecode(response.body);

        if(response.statusCode != 200) {
          return ResponseModel.error(ErrorResponseModel.fromJson(responseBody));
        }

        return ResponseModel.getAllDoctor(AllDoctorModel.fromJson(responseBody));
      
    } catch (e) {
      throw Exception("Error is in all doctor service and error is: $e");
    }
  }

  Future<ResponseModel> getADoctorService(String doctorId) async {
    try {

      var getDoctorUrl = Uri.parse(getADoctor(doctorId));
      var response = await http.get(getDoctorUrl, headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
      });

      var responseBody = jsonDecode(response.body);

      if(response.statusCode != 200) {
       return ResponseModel.error(ErrorResponseModel.fromJson(responseBody));
      }

      return ResponseModel.getDoctor(DoctorResponseModel.fromJson(responseBody));
      
    } catch (e) {
      throw Exception("Error is in doctor service and error is: $e");
    }
  }
}