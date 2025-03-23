import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';
import 'package:skinfirst/widgets/doctor_info_card/doctor_info_card.dart';

class DoctorListView extends StatelessWidget {
  DoctorListView({super.key});

  final DoctorController _doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios, color: appTheme,)
        ),
        title: Text("Doctor's", style: TextStyle(
          color: appTheme,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: subTheme,
                child: Icon(Icons.search_outlined, color: appTheme,),
              ),
            ),
          )
        ],
      ),

      body: SafeArea(
        child: Obx(
          () {

            if(_doctorController.allDoctors.isEmpty) {
              return Center(
                child: CircularProgressIndicator(color: appTheme,),
              );
            }



            return ListView.builder(
              itemCount: _doctorController.noOfDoctors.value,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: DoctorInfoCard(
                  doctorName: _doctorController.allDoctors[index].name,
                  highestQualification: _doctorController.allDoctors[index].highestDegree,
                  specialization: _doctorController.allDoctors[index].specialization,
                  doctorId: _doctorController.allDoctors[index].id,
                )
              ),
            );
          }
        ),
      ),
    );
  }
}