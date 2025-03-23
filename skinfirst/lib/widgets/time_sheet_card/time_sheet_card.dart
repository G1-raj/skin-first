import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/appointment_controller.dart';
import 'package:skinfirst/helpers/format_date.dart';

class TimeSheetCard extends StatefulWidget {
  final String patientId;
  const TimeSheetCard({super.key, required this.patientId});

  @override
  State<TimeSheetCard> createState() => _TimeSheetCardState();
}

class _TimeSheetCardState extends State<TimeSheetCard> {

  final AppointmentController _appointmentController = Get.put(AppointmentController());

  @override
  void initState() {
    super.initState();

    _appointmentController.getUpcomingAppointmentDetailsController(widget.patientId);

  }



  @override
  Widget build(BuildContext context) {
    return Obx(
      () {

        if(_appointmentController.upcomingAppointment.value == null) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(15.0)
             ),
             child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height:  MediaQuery.of(context).size.height * 0.7,
                    child: Image(
                      image: AssetImage(appLogo),
                    ),
                  ),
                ),

                 const SizedBox(width: 12,),

                 const Text("No upcoming appointments", style: TextStyle(
                  fontWeight: FontWeight.bold
                 ),),

              ],
             ),
            ),
          );
        }

        final String appointmentDate = formatedDateWithDateAndMont(_appointmentController.upcomingAppointment.value!.appointmentDate);
        final String appointmentTime = _appointmentController.upcomingAppointment.value!.appointmentTime;
        final String doctorName = _appointmentController.upcomingAppointment.value!.doctor.name;


        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(15.0)
            ),
        
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height:  MediaQuery.of(context).size.height * 0.7,
                    child: Image(
                      image: AssetImage(appLogo),
                    ),
                  ),
                ),
        
                const SizedBox(width: 12,),
        
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey!", style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
        
                    Text("Your next appointment"),
        
                    const SizedBox(height: 5,),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(appointmentDate, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
        
                        const SizedBox(width: 12,),
        
                        Text(appointmentTime, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),)
                      ],
                    ),
        
                    Text("with"),
        
                    const SizedBox(height: 6,),
        
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        color: appTheme,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: subTheme,
                              radius: 12,
                              child: Icon(Icons.person),
                            ),
        
                            Text(doctorName, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                            ),)
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        );
      }
    );
  }
}