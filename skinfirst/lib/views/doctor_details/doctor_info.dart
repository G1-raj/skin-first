import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';
import 'package:skinfirst/widgets/detail_card/detail_card.dart';

class DoctorInfo extends StatelessWidget {
  DoctorInfo({super.key});

  final DoctorController _doctorController = Get.put(DoctorController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

   final String doctorId = Get.arguments?['doctorId'] ?? 0;

   _doctorController.getADoctorDetailController(doctorId);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios, color: appTheme,)
        ),
        title: Text("Doctor info", style: TextStyle(fontWeight: FontWeight.bold, color: appTheme),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () {

              if(_doctorController.doctorDetails.value == null) {
                return Center(
                  child: CircularProgressIndicator(color: appTheme,),
                );
              }



              return Center(
                child: Column(
                  children: [
              
                   DetailCard(
                        doctorName: _doctorController.doctorDetails.value!.name, 
                        highestQualification: _doctorController.doctorDetails.value!.highestDegree, 
                        specialization: _doctorController.doctorDetails.value!.specialization, 
                        noOfExpereience: _doctorController.doctorDetails.value!.yearsOfExperience, 
                        title: _doctorController.doctorDetails.value!.title,
                        patientId: _authController.user.value!.id,
                        doctorId: doctorId
                    ),
                     
              
                   Divider(
                    indent: MediaQuery.of(context).size.width * 0.3,
                    endIndent: MediaQuery.of(context).size.width * 0.3,
                    thickness: 4,
                    color: subTheme,
                   ),
              
                   const SizedBox(height: 18,),
              
                   Padding(
                     padding: const EdgeInsets.only(left: 18.0),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Profile", style: TextStyle(
                           color: appTheme,
                           fontWeight: FontWeight.bold,
                           fontSize: 18
                         ),),
                   
                         Text(_doctorController.doctorDetails.value!.profile, style: TextStyle(
                           color: Colors.black,
                           fontSize: 16
                         ),),
                       ],
                     ),
                   ),
              
                   Divider(
                    indent: MediaQuery.of(context).size.width * 0.3,
                    endIndent: MediaQuery.of(context).size.width * 0.3,
                    thickness: 4,
                    color: subTheme,
                   ),
              
                   const SizedBox(height: 12,),
                   Padding(
                     padding: const EdgeInsets.only(left: 18.0),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Highlight", style: TextStyle(
                           color: appTheme,
                           fontWeight: FontWeight.bold,
                           fontSize: 18
                         ),),
                   
                         Text(_doctorController.doctorDetails.value!.highlight, style: TextStyle(
                           color: Colors.black,
                           fontSize: 16
                         ),),
                       ],
                     ),
                   ),
              
                  
              
                   const SizedBox(height: 12,),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
