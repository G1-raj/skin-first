import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/views/appointment/cancelled_appointment_view.dart';
import 'package:skinfirst/views/appointment/completed_appointment_view.dart';
import 'package:skinfirst/views/appointment/upcoming_appointment_view.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Appointment",
            style: TextStyle(
              color: appTheme,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Color.fromRGBO(255, 255, 255, 2),
            indicator: ShapeDecoration(
              color: appTheme,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
            ),
            unselectedLabelColor: Colors.grey,
            indicatorColor: appTheme,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: "Complete"),
              Tab(text: "Upcoming"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: TabBarView(
            children: [
              CompletedAppointmentView(),
              UpcomingAppointmentView(),
              CancelledAppointmentView()
            ],
          ),
        ),
      ),
    );
  }
}
