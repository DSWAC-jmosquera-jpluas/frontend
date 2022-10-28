import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/services/api_service.dart';
import 'package:citasmedicas/src/appoinments/appoiment_detail_patient.dart';
import 'package:flutter/material.dart';

/// Imports [libraries]
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definicion de provider para uso de la vista
final homePatientProvider =
    Provider.autoDispose((ref) => HomePatientController());

class HomePatientController extends ChangeNotifier {
  final TextEditingController appoimentInput = TextEditingController();
  final Appoiment appoiment = Appoiment();

  getAppoiment(context) async {
    var appoiment = await apiService.getById(appoimentInput.text);
    appoiment = appoiment;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AppoimentDetailPatient(appoiment: appoiment)));
    notifyListeners();
  }
}
