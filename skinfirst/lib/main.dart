import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:skinfirst/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_screen",
      getPages: AppRoutes.appRoutes(),
    );
  }
}