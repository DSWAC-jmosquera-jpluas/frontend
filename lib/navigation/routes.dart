import 'package:citasmedicas/navigation/routes_name.dart';
import 'package:citasmedicas/src/appoinments/appoinments_view.dart';
import 'package:citasmedicas/src/home/home_view.dart';
import 'package:citasmedicas/src/home_doctor/home_doctor_view.dart';
import 'package:citasmedicas/src/home_patient/home_patient_view.dart';
import 'package:citasmedicas/src/new_appoinment/new_appoinments_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homePage:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomeView());
      case RouteNames.homePatientPage:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const HomePatientView());
      case RouteNames.homeDoctorPage:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const HomeDoctorView());
      case RouteNames.appoinments:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const AppoinmentsView());
      case RouteNames.newAppoinment:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const NewAppoinmentView());

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const NewAppoinmentView());
    }
  }
}
