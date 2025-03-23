import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';

class CancelledAppointmentCard extends StatelessWidget {
  final String doctorName;
  final String highestQualification;
  final String specialization;
  const CancelledAppointmentCard({
    super.key,
    required this.doctorName,
    required this.highestQualification,
    required this.specialization
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Card(
          color: subTheme,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CircleAvatar(
                      radius: 45,
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

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage("https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"),
                                  ),

                                  const SizedBox(width: 12,),

                                  Text("Dr. Olivia Turner", style: TextStyle(
                                    color: appTheme,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),

                              const SizedBox(height: 18,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: subTheme,
                                    child: Icon(Icons.favorite, color: appTheme,),
                                  ),

                                  const SizedBox(width: 8,),

                                  Container(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: subTheme
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star, color: appTheme,),
                                        Icon(Icons.star, color: appTheme,),
                                        Icon(Icons.star, color: appTheme,),
                                        Icon(Icons.star, color: appTheme,),
                                        Icon(Icons.star_outline, color: appTheme,),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(height: 18,),

                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width  * 0.85,
                                  child: TextField(
                                    maxLines: null,
                                    expands: true,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      hintText: "Write Your Review...",
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
                                onPressed: () {}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: appTheme
                                ),
                                child: Text("Add Review", style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.bold
                                ),)
                              )
                            ],
                          ),
                        ),
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appTheme,
                    foregroundColor: Color.fromRGBO(255, 255, 255, 1)
                  ),
                  child: Text("Add Review"),
                ),
              ),

              const SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}