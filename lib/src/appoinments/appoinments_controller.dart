import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/models/doctor.dart';
import 'package:citasmedicas/models/patient.dart';
import 'package:citasmedicas/services/api_service.dart';
import 'package:flutter/material.dart';

/// Imports [libraries]
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definicion de provider para uso de la vista
final appoinmentsProvider = ChangeNotifierProvider<AppoinmentsController>(
    (ref) => AppoinmentsController());

class AppoinmentsController extends ChangeNotifier {
//AppoimentList
  List<Appoiment> appoinmentsList = [];
  bool loading = true;
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
  TextEditingController appoinmentObservationController =
      TextEditingController();
  late bool statusAppoinment;
  bool isFirstTime = true;

  void populateFields(Appoiment appoiment) {
    //Validate doctor and patient objects null
    if (appoiment.doctor != null) {
      doctorDniController.text = appoiment.doctor?.dni.toString() ?? '';
      doctorNameController.text = appoiment.doctor?.name ?? '';
      doctorLastNameController.text = appoiment.doctor?.lastName ?? '';
      doctorSpecialtyController.text = appoiment.doctor?.specialty ?? '';
    } else {
      doctorDniController.text = '';
      doctorNameController.text = '';
      doctorLastNameController.text = '';
      doctorSpecialtyController.text = '';
    }

    //patient
    if (appoiment.patient != null) {
      patientDniController.text = appoiment.patient?.dni.toString() ?? '';
      patientNameController.text = appoiment.patient?.name ?? '';
      patientLastNameController.text = appoiment.patient?.lastName ?? '';
      patientBirthdayController.text = appoiment.patient?.birthday ?? '';
    } else {
      patientDniController.text = '';
      patientNameController.text = '';
      patientLastNameController.text = '';
      patientBirthdayController.text = '';
    }
    appoinmentPlaceController.text = appoiment.appoinmentPlace ?? '';
    appoinmentDateController.text = appoiment.appoinmentDate ?? '';
    appoinmentHourController.text = appoiment.appoinmentHour ?? '';
    appoinmentObservationController.text =
        appoiment.appoinmentObservation ?? '';
    statusAppoinment = appoiment.appoinmentStatus ?? false;
    notifyListeners();
  }

  setAppoimentStatus(status) {
    print(status);
    statusAppoinment = status;
    notifyListeners();
  }

  Future<bool> updateAppoiment(id) async {
    //get data from fields to update appoinment
    Doctor doctor = Doctor(
      id: id,
      dni: int.parse(
        patientDniController.text,
      ),
      name: doctorNameController.text,
      lastName: doctorLastNameController.text,
      specialty: doctorSpecialtyController.text,
    );
    Patient patient = Patient(
      id: id,
      dni: int.parse(
        patientDniController.text,
      ),
      name: patientNameController.text,
      lastName: patientLastNameController.text,
      birthday: patientBirthdayController.text,
    );
    Appoiment appoiment = Appoiment(
        id: id,
        doctor: doctor,
        patient: patient,
        appoinmentPlace: appoinmentPlaceController.text,
        appoinmentDate: appoinmentDateController.text,
        appoinmentHour: appoinmentHourController.text,
        appoinmentObservation: appoinmentObservationController.text,
        appoinmentStatus: statusAppoinment);
    var status = await apiService.update(appoiment);

    return status;
  }

  getAppoimentsList() async {
    if (isFirstTime) {
      appoinmentsList = await apiService.getAll();
      loading = false;
      isFirstTime = false;
      notifyListeners();
    }
  }

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  setIsFirstTime(value) {
    isFirstTime = value;
    notifyListeners();
  }

  Future<bool> deleteAppoiment(Appoiment appoiment) async {
    var status = await apiService.delete(appoiment);
    if (status) {
      appoinmentsList.remove(appoiment);
      notifyListeners();
    }
    return status;
  }
}
