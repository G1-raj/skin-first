import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/appointment_controller.dart';
import 'package:skinfirst/helpers/format_date.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final String appointmentId;
  final String appointmentTime;
  final String appointmentDate;
  final String doctorName;
  final String highestQualification;
  final String specialization;
  UpcomingAppointmentCard({
    super.key, 
    required this.appointmentId, 
    required this.appointmentTime,
     required this.appointmentDate, 
     required this.doctorName, 
     required this.highestQualification, 
     required this.specialization
  });


  final AppointmentController _appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {

    String desireDate = formatedDateWithDateAndMont(appointmentDate);

    return SizedBox(
      height: Get.height * 0.30,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Card(
          color: subTheme,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(personMascot),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$doctorName, $highestQualification", style: TextStyle(color: appTheme, fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(specialization, style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 12),)
                    ],
                  )
                ],
              ),

              const SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color.fromRGBO(255, 255, 255, 1)
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined, color: appTheme,),
                        const SizedBox(width: 8,),
                        Text(desireDate, style: TextStyle(color: appTheme),)
                      ],
                    ),
                  ),

                  const SizedBox(width: 6,),

                  Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color.fromRGBO(255, 255, 255, 1)
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm_outlined, color: appTheme),
                        const SizedBox(width: 3),
                        Flexible(
                          child: Text(
                            appointmentTime,
                            style: TextStyle(color: appTheme),
                            overflow: TextOverflow.ellipsis, // Prevents overflow
                            softWrap: true, // Allows wrapping if needed
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
              const SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/review_appointment", arguments: {
                        "isUpcoming": false
                      });
                    },
                    child: Container(
                      height: Get.height * 0.04,
                      width: Get.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: appTheme
                      ),
                    
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Details", style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                      ),
                    ),
                  ),

                  const SizedBox(width: 6,),

                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        isDismissible: true,
                        barrierColor: Color.fromRGBO(34, 96, 255, 0.5),
                        Container(
                          height: Get.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0),
                          ),),

                          child: Column(
                            children: [
                              const SizedBox(height: 12,),
                              Text("Reason for cancelling appointment", style: TextStyle(
                                color: appTheme,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),

                               const SizedBox(height: 18,),

                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width  * 0.85,
                                  child: TextField(
                                    maxLines: null,
                                    expands: true,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      hintText: "Write Your Reason...",
                                      filled: true,
                                      fillColor: subTheme,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                                      ),
                                    ),
                                  )
                                ),
                              ),


                              const SizedBox(height: 18,),

                              ElevatedButton(
                                onPressed: () {
                                  _appointmentController.cancelAppointmentController(appointmentId);
                                }, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: appTheme
                                ),
                                child: Text("Cancel", style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.bold
                                ),)
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: appTheme,
                      child: Icon(Icons.cancel_outlined, color: Colors.white,),
                    ),
                  )

                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}