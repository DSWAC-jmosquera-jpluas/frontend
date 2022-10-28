import 'package:citasmedicas/models/doctor.dart';
import 'package:citasmedicas/models/patient.dart';

class Appoiment {
  num? id;
  Doctor? doctor;
  Patient? patient;
  String? appoinmentPlace;
  String? appoinmentDate;
  String? appoinmentHour;
  bool? appoinmentStatus;
  String? appoinmentObservation;

  Appoiment({
    this.id,
    this.doctor,
    this.patient,
    this.appoinmentPlace,
    this.appoinmentDate,
    this.appoinmentHour,
    this.appoinmentStatus = true,
    this.appoinmentObservation,
  });

  factory Appoiment.fromJson(Map<String, dynamic> json) => Appoiment(
        id: json["citaMedicaId"],
        //Validate if null and return a new instance of Doctor
        doctor:
            json["doctor"] == null ? Doctor() : Doctor.fromJson(json["doctor"]),
        //Validate if null and return a new instance of Patient
        patient: json["paciente"] == null
            ? Patient()
            : Patient.fromJson(json["paciente"]),

        appoinmentPlace: json["citaMedicaLugar"],
        appoinmentDate: json["citaMedicaFecha"],
        appoinmentHour: json["citaMedicaHora"],
        appoinmentStatus: json["citaMedicaEstatus"],
        appoinmentObservation: json["citaMedicaObservacion"],
      );

  Map<String, dynamic> toJson() => {
        "citaMedicaId": id,
        "doctor": doctor!.toJson(),
        "paciente": patient!.toJson(),
        "citaMedicaLugar": appoinmentPlace,
        "citaMedicaFecha": appoinmentDate,
        "citaMedicaHora": appoinmentHour,
        "citaMedicaEstatus": appoinmentStatus,
        "citaMedicaObservacion": appoinmentObservation,
      };

  //to String
  @override
  String toString() {
    return 'Appoiment{id: $id, doctor: $doctor, patient: $patient, appoinmentPlace: $appoinmentPlace, appoinmentDate: $appoinmentDate, appoinmentHour: $appoinmentHour, appoinmentStatus: $appoinmentStatus, appoinmentObservation: $appoinmentObservation}';
  }
}
