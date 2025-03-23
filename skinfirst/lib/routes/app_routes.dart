import 'package:get/route_manager.dart';
import 'package:skinfirst/routes/route_name.dart';
import 'package:skinfirst/views/appointment/appointment_view.dart';
import 'package:skinfirst/views/appointment/book_appointment_view.dart';
import 'package:skinfirst/views/appointment/cancelled_appointment_view.dart';
import 'package:skinfirst/views/appointment/completed_appointment_view.dart';
import 'package:skinfirst/views/appointment/review_appointment_view.dart';
import 'package:skinfirst/views/appointment/upcoming_appointment_view.dart';
import 'package:skinfirst/views/auth/auth_navigator.dart';
import 'package:skinfirst/views/auth/login/forgot_password_view.dart';
import 'package:skinfirst/views/auth/login/login_view.dart';
import 'package:skinfirst/views/auth/signup/signup_view.dart';
import 'package:skinfirst/views/doctor_details/doctor_info.dart';
import 'package:skinfirst/views/doctor_details/doctor_list_view.dart';
import 'package:skinfirst/views/home/home_screen_view.dart';
import 'package:skinfirst/views/home/home_view.dart';
import 'package:skinfirst/views/home/splash_screen_view.dart';
import 'package:skinfirst/views/notifications/notification_view.dart';
import 'package:skinfirst/views/profile/edit_profile_view.dart';
import 'package:skinfirst/views/profile/notification_settings_view.dart';
import 'package:skinfirst/views/profile/password_manager.dart';
import 'package:skinfirst/views/profile/profile_view.dart';
import 'package:skinfirst/views/profile/settings_view.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreenView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.authNavigator,
      page: () => AuthNavigator(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.signup,
      page: () => SignupView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.forgotPassword,
      page: () => ForgotPasswordView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.home,
      page: () => HomeView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.homeView,
      page: () => HomeScreenView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.settings,
      page: () => SettingsView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.profile,
      page: () => ProfileView(),
      transition: Transition.topLevel
    ),

    GetPage(
      name: RouteName.passwordManager,
      page: () => PasswordManager(),
      transition: Transition.topLevel
    ),

    GetPage(
      name: RouteName.notificationSettings,
      page: () => NotificationSettingsView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.editProfile,
      page: () => EditProfileView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.notification,
      page: () => NotificationView(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: RouteName.doctorInfo,
      page: () => DoctorInfo(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.doctorList,
      page: () => DoctorListView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.appointment,
      page: () => AppointmentView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.cancelledAppointment,
      page: () => CancelledAppointmentView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.completedAppointment,
      page: () => CompletedAppointmentView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.unpcomingAppointment,
      page: () => UpcomingAppointmentView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.bookingAppointment,
      page: () => BookAppointmentView(),
      transition: Transition.leftToRight
    ),

    GetPage(
      name: RouteName.reviewAppointment,
      page: () => ReviewAppointmentView(),
      transition: Transition.leftToRight
    ),
  ];
}
