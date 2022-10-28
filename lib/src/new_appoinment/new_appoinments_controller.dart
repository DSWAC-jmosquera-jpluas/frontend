import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/models/doctor.dart';
import 'package:citasmedicas/models/patient.dart';
import 'package:citasmedicas/services/api_service.dart';
import 'package:citasmedicas/src/new_appoinment/appoiment_form.dart';
import 'package:citasmedicas/src/new_appoinment/doctor_form.dart';
import 'package:citasmedicas/src/new_appoinment/patient_form.dart';
import 'package:flutter/material.dart';

/// Imports [libraries]
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definicion de provider para uso de la vista
final newAppoinmentsProvider = ChangeNotifierProvider<NewAppoinmentsController>(
    (ref) => NewAppoinmentsController());

class NewAppoinmentsController extends ChangeNotifier {
  int step = 0;
  setStep(int value) {
    step = value;
    notifyListeners();
  }

  TextEditingController doctorDniController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorLastNameController = TextEditingController();
  TextEditingController doctorSpecialtyController = TextEditingController();
  TextEditingController patientDniController = TextEditingController();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientLastNameController = TextEditingController();
  TextEditingController patientBirthdayController = TextEditingController();
  TextEditingController appoinmentPlaceController = TextEditingController();
  TextEditingController appoinmentDateController = TextEditingController();
  TextEditingController appoinmentHourController = TextEditingController();
  late bool success = false;
  TextEditingController appoinmentObservationController =
      TextEditingController();

  void clearControllers() {
    doctorNameController.clear();
    doctorLastNameController.clear();
    doctorSpecialtyController.clear();
    patientDniController.clear();
    patientNameController.clear();
    patientLastNameController.clear();
    patientBirthdayController.clear();
    appoinmentPlaceController.clear();
    appoinmentDateController.clear();
    appoinmentHourController.clear();
    appoinmentObservationController.clear();
  }

  @override
  void dispose() {
    doctorNameController.dispose();
    doctorLastNameController.dispose();
    doctorSpecialtyController.dispose();
    patientDniController.dispose();
    patientNameController.dispose();
    patientLastNameController.dispose();
    patientBirthdayController.dispose();
    appoinmentPlaceController.dispose();
    appoinmentDateController.dispose();
    appoinmentHourController.dispose();
    appoinmentObservationController.dispose();
    super.dispose();
  }

  Future<bool> saveAppoinment() async {
    //parse birthdate to the format     2022-10-22T04:35:51.6972079+00:00
    print(patientBirthdayController.text);
    var date = patientBirthdayController.text.split("/");
    var birthdate = "${date[2]}-${date[1]}-${date[0]}T00:00:00.0000000Z";

    //appoiment date
    print(appoinmentDateController.text);
    var appoimentDate = appoinmentDateController.text.split("/");
    var appoimentDateFormated =
        "${appoimentDate[2]}-${appoimentDate[1]}-${appoimentDate[0]}T00:00:00.0000000Z";

    Patient patient = Patient(
        id: 0,
        dni: int.parse(patientDniController.text),
        name: patientNameController.text,
        lastName: patientLastNameController.text,
        birthday: birthdate);
    Doctor doctor = Doctor(
        id: 0,
        dni: int.parse(doctorDniController.text),
        name: doctorNameController.text,
        lastName: doctorLastNameController.text,
        specialty: doctorSpecialtyController.text);
    Appoiment appoiment = Appoiment(
        id: 0,
        doctor: doctor,
        patient: patient,
        appoinmentPlace: appoinmentPlaceController.text,
        appoinmentDate: appoimentDateFormated,
        appoinmentHour: appoinmentHourController.text,
        appoinmentObservation: appoinmentObservationController.text,
        appoinmentStatus: true);
    var status = await apiService.save(appoiment);
    if (status) {
      return true;
    } else {
      return false;
    }
  }

  obtainViewForStep() {
    switch (step) {
      case 0:
        return const DoctorForm();
      case 1:
        return const PatientForm();
      case 2:
        return const AppoimentForm();
      default:
        return const DoctorForm();
    }
  }
}
