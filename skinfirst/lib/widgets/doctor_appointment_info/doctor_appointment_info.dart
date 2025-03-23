import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';

class DoctorAppointmentInfo extends StatelessWidget {
  final String doctorId;
  DoctorAppointmentInfo({super.key, required this.doctorId});

  final DoctorController _doctorController = Get.put(DoctorController());

   @override
  Widget build(BuildContext context) {

    _doctorController.getADoctorDetailController(doctorId);

    return Padding(
      padding: const EdgeInsets.all(0.0),
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
                      backgroundImage: const NetworkImage(
                        "https://i.pinimg.com/736x/1b/52/fd/1b52fd81c2282b432b85dc6a8a01f13d.jpg",
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Doctor's Info
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                           () {
                              return Text(
                                _doctorController.doctorDetails.value!.name,
                                style: TextStyle(
                                  color: appTheme,
                                  fontSize: width * 0.06, // Responsive text size
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                          ),
                          Obx(
                            () {
                              return Text(
                                _doctorController.doctorDetails.value!.highestDegree,
                                style: TextStyle(color: appTheme, fontSize: width * 0.04),
                              );
                            }
                          ),
                          Obx(
                            () {
                              return Text(
                                _doctorController.doctorDetails.value!.specialization,
                                style: TextStyle(color: Colors.black, fontSize: width * 0.035),
                              );
                            }
                          ),
                          const SizedBox(height: 9),
                          
                          // Buttons Row
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              _buildIconButton(Icons.rate_review_outlined),
                              _buildIconButton(Icons.help_center_outlined),
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
