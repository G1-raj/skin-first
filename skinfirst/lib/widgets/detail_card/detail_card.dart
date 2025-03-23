import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';

class DetailCard extends StatelessWidget {
  final String doctorName;
  final String highestQualification;
  final String specialization;
  final int noOfExpereience;
  final String title;
  final String patientId;
  final String doctorId;
  const DetailCard(
    {
      super.key, 
      required this.doctorName, 
      required this.highestQualification, 
      required this.specialization, 
      required this.noOfExpereience, 
      required this.title,
      required this.patientId,
      required this.doctorId
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.60,
      child: Card(
        color: subTheme,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  backgroundImage: AssetImage(personMascot),
                ),

                const SizedBox(width: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: appTheme,
                        borderRadius: BorderRadius.circular(30.0)
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.explore, color: Colors.white,),
                          const SizedBox(width: 8,),
                          Text("$noOfExpereience years \nexperience", style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),)
                        ],
                      ),
                    ),

                    const SizedBox(height: 2,),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: appTheme,
                        borderRadius: BorderRadius.circular(30.0)
                      ),

                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(title, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)
                          ),),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 9,),

            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(30.0)
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("$doctorName $highestQualification", style: TextStyle(
                    color: appTheme,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),

                  Text(specialization)
                ],
              ),
            ),
            const SizedBox(height: 9,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: appTheme,),
                      const SizedBox(width: 5,),
                      Text("5", style: TextStyle(color: appTheme),),
                    ],
                  ),
                ),

                const SizedBox(width: 12,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_bubble_outline, color: appTheme,),
                      const SizedBox(width: 3,),
                      Text("50", style: TextStyle(color: appTheme),),
                    ],
                  ),
                ),
                
                const SizedBox(width: 9,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.alarm, color: appTheme),
                      const SizedBox(width: 3),
                      
                      // Wrap Text in Expanded to prevent overflow
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Mon-Sat / 9:00 AM - 5:00 PM",
                            style: TextStyle(color: appTheme, fontSize: 12), // Slightly increased font for better readability
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(width: 8,),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/booking_appointment", arguments: {
                      "patientId": patientId,
                      "doctorId": doctorId
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: appTheme,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined, color: Color.fromRGBO(255, 255, 255, 1),),
                        const SizedBox(width: 3,),
                        Text("Schedule", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),

                Spacer(),

                _buildIconButton(Icons.calendar_month_outlined),
                _buildIconButton(Icons.info_outline),
                _buildIconButton(Icons.question_mark_outlined),
                _buildIconButton(Icons.favorite_outline),

                 const SizedBox(width: 8,),
              ],
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildIconButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(icon, size: 18, color: Colors.black87),
        ),
      ),
    );
  }
}