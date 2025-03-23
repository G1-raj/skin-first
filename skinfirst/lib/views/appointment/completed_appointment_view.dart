import 'package:flutter/material.dart';
import 'package:skinfirst/widgets/completed_appoointment_card/completed_appointment_card.dart';

class CompletedAppointmentView extends StatelessWidget {
  const CompletedAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => CompletedAppointmentCard(),
      ),
    );
  }
}