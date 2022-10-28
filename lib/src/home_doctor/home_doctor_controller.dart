import 'package:flutter/material.dart';

/// Imports [libraries]
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definicion de provider para uso de la vista
final homeProvider = Provider.autoDispose((ref) => HomeDoctorController());

class HomeDoctorController extends ChangeNotifier {}
