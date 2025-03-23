import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';

class CompletedAppointmentCard extends StatelessWidget {
  const CompletedAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
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
                      radius: 45,
                      backgroundImage: AssetImage(personMascot),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Olivia Turner, M.D.", style: TextStyle(color: appTheme, fontSize: 16, fontWeight: FontWeight.bold),),
                      Text("Dermatology-Endocrinology", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 12),)
                    ],
                  )
                ],
              ),

              const SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/booking_appointment");
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1)
                      ),
                      child: Text("Re-Book", style: TextStyle(
                        color: appTheme,
                        fontWeight: FontWeight.bold
                      ),)
                    ),
                  ),

                  const SizedBox(width: 12,),

                  SizedBox(
                    width: Get.width * 0.4,
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
                                        backgroundImage: AssetImage(personMascot),
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
                        backgroundColor: appTheme
                      ),
                      child: Text("Add Review", style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.bold
                      ),)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}