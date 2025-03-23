import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';

class DoctorInfoCard extends StatelessWidget {
  final String doctorName;
  final String highestQualification;
  final String specialization;
  final String doctorId;
  const DoctorInfoCard({super.key, required this.doctorName, required this.highestQualification, required this.specialization, required this.doctorId});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth * 0.9;
          // double height = constraints.maxHeight * 0.3;
          double avatarRadius = width * 0.15; // Adjust dynamically

          return SizedBox(
            width: width,
            child: Card(
              color: subTheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: const AssetImage(
                        personMascot
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Doctor's Info
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: TextStyle(
                              color: appTheme,
                              fontSize: width * 0.06, // Responsive text size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            highestQualification,
                            style: TextStyle(color: appTheme, fontSize: width * 0.04),
                          ),
                          Text(
                            specialization,
                            style: TextStyle(color: Colors.black, fontSize: width * 0.035),
                          ),
                          const SizedBox(height: 9),
                          
                          // Buttons Row
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/doctor_info", arguments: {
                                    "doctorId": doctorId
                                  });
                                },
                                child: _buildInfoButton())
                              ,
                              const SizedBox(width: 10),
                              _buildIconButton(Icons.calendar_month_outlined),
                              _buildIconButton(Icons.info_outline),
                              _buildIconButton(Icons.question_mark_outlined),
                              _buildIconButton(Icons.favorite_outline),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Reusable info button
  Widget _buildInfoButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: appTheme,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: const Text(
        "Info",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Reusable circular icon button
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
