import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/active_chip/active_chip.dart';

class SubIntroCard extends StatelessWidget {
  final String doctorName;
  final String highestQualification;
  final String specialization;
  final String doctorId;
  const SubIntroCard({super.key, required this.doctorName, required this.highestQualification, required this.specialization, required this.doctorId});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.toNamed("/doctor_info", arguments: {
          "doctorId": doctorId
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.width * 0.35,
          child: Card(
            color: subTheme,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(personMascot),
                ),
      
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text("$doctorName $highestQualification", style: TextStyle(
                              color: appTheme,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(specialization, style: TextStyle(
                              color: Colors.black,
                              fontSize: 12
                            ),),
                          ),
                        ],
                      ),
                    ),
      
                    const SizedBox(height: 5,),
      
                    Row(
                      children: [
                        ActiveChip(
                          chipIcon: Icons.favorite,
                          chipText: "5",
                        ),
      
                        ActiveChip(
                          chipIcon: Icons.chat_bubble,
                          chipText: "40",
                        ),
      
                        const SizedBox(width: 18,),
      
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          child: Icon(Icons.question_mark, color: appTheme,),
                        ),
      
                        const SizedBox(width: 4,),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          child: Icon(Icons.favorite, color: appTheme,),
                        )
      
                        
      
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}