import 'package:flutter/material.dart';

const appTheme = Color.fromRGBO(34, 96, 255, 1);
const subTheme = Color.fromRGBO(201, 214, 255, 1);

const appLogo = "lib/assets/skin-first-logo.png";
const personMascot = "lib/assets/person_logo.png";

const String ipAddress = "192.168.93.170";

//user routes
const String signup = "http://$ipAddress:3000/api/v1/user/signup";//post request
const String login = "http://$ipAddress:3000/api/v1/user/login";//post request
const String forgotPassword = "http://$ipAddress:3000/api/v1/user/forgotpassword";//post request


//doctors routes
const String addADoctor = "http://$ipAddress:3000/api/v1/user/doctor/add";//post request
const String getAllDoctors = "http://$ipAddress:3000/api/v1/user/doctor/getall"; //get request
dynamic getADoctor(String doctorId) => "http://$ipAddress:3000/api/v1/user/doctor/getdoctor/$doctorId"; //get request

//appointment routes
dynamic makeAppointment(String patientId, String doctorId) => "http://$ipAddress:3000/api/v1/user/appointment/$patientId/$doctorId"; //post request
dynamic getUpcomingAppointmentDetails(String patientId) => "http://$ipAddress:3000/api/v1/user/appointment/getlatest/$patientId"; //get request

dynamic uploadProfile(String patientId) => "http://$ipAddress:3000/api/v1/user/update/addprofile/$patientId"; //patch request


dynamic getAllUpcomingAppointment(String patientId) => "http://$ipAddress:3000/api/v1/user/appointment/allupcoming/$patientId"; //get request 
dynamic getAllCancelledAppointments(String patientId) => "http://$ipAddress:3000/api/v1/user/appointment/cancelled/$patientId"; //get request 
dynamic cancelAppointment(String appointmentId) => "http://$ipAddress:3000/api/v1/user/appointment/cancel/$appointmentId"; //patch request
