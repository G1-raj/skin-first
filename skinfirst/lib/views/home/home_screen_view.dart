import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/controllers/auth_controller.dart';
import 'package:skinfirst/controllers/doctor_controller.dart';
// import 'package:skinfirst/widgets/date_chip/date_chip.dart';
import 'package:skinfirst/widgets/head_app_bar/head_app_bar.dart';
import 'package:skinfirst/widgets/sub_intro_card/sub_intro_card.dart';
import 'package:skinfirst/widgets/time_sheet_card/time_sheet_card.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});

  final DoctorController _doctorController = Get.put(DoctorController());
  final AuthController _authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            bool isLargeScreen = screenWidth > 600; // Consider tablet & large screens

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  expandedHeight: isLargeScreen ? 200 : 180,
                  snap: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: HeadAppBar(),
                  ),
                ),

                Obx(
                  () {

                    if(_authController.user.value == null) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text("Failed to get user details please login again"),
                        ),
                      );
                    }


                    return SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        height: isLargeScreen
                            ? MediaQuery.of(context).size.height * 0.28
                            : MediaQuery.of(context).size.height * 0.35,
                        padding: const EdgeInsets.only(bottom: 15.0),
                        color: subTheme,
                        child: Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: TimeSheetCard(
                              patientId: _authController.user.value!.id,
                            )
                          )
                        ),
                      ),
                    );
                  }
                ),

                Obx(
                  () {

                   if(_doctorController.allDoctors.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: appTheme,
                          ),
                        ),
                      ),
                    );
                   }


                    return SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 20.0 : 10.0,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                              bottom: isLargeScreen ? 12.0 : 8.0),
                              child: SubIntroCard(
                                doctorName: _doctorController.allDoctors[index].name, 
                                highestQualification: _doctorController.allDoctors[index].highestDegree, 
                                specialization: _doctorController.allDoctors[index].specialization,
                                doctorId:  _doctorController.allDoctors[index].id,
                              ),
                            );
                          },
                          childCount: _doctorController.noOfDoctors.value,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


// class HomeScreenView extends StatelessWidget {
//   HomeScreenView({super.key});

//   final DoctorController _doctorController = Get.put(DoctorController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               HeadAppBar(),
          
//               Obx(
//                 () {

//                   if(_doctorController.allDoctors.isEmpty) {
//                     return CircularProgressIndicator(color: appTheme,);
//                   }



//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: _doctorController.allDoctors.length,
//                       itemBuilder: (context, index) {
//                         if(index == 0) {
//                             return Container(
//                             width: double.infinity,
//                             height: MediaQuery.of(context).size.height * 0.35,
//                             padding: const EdgeInsets.only(bottom: 15.0),
//                             color: subTheme,
//                             child: Column(
//                               children: [
                            
//                                 Expanded(
//                                   child: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     itemCount: 7,
//                                     itemBuilder: (context, index) {
//                                       return DateChip();
//                                     },
//                                   ),
//                                 ),
                            
//                                 const SizedBox(height: 4,),
                            
//                                 TimeSheetCard()
                            
//                                 // Container(
//                                 //   height: 150,
//                                 //   width: double.infinity,
//                                 //   color: Colors.amber,
//                                 // )
//                               ],
//                             ),
//                           );
//                         }
                            
//                         return SubIntroCard();
//                       },
//                     ),
//                   );
//                 }
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }