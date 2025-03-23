import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/widgets/notification_card/notification_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios, color: appTheme,)
        ),
        title: Text("Notifications", style: TextStyle(
          color: appTheme,
          fontWeight: FontWeight.bold
        ),),

        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      color: subTheme,
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Today", style: TextStyle(
                        color: appTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18,),

             Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => NotificationCard(),
              ),
             )
            ],
          )
        ),
      ),
    );
  }
}