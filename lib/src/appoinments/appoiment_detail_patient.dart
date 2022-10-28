import 'package:citasmedicas/models/appoinment.dart';
import 'package:flutter/material.dart';

class AppoimentDetailPatient extends StatelessWidget {
  final Appoiment appoiment;

  const AppoimentDetailPatient({Key? key, required this.appoiment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de cita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //card with patient information
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                shadowColor: Colors.amber.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text("Datos del Paciente",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.person),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Cedula: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.patient?.dni.toString() ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Paciente: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.patient?.name ??
                              "} ${appoiment.patient?.lastName! ?? ""}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Fecha de nacimiento: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.patient?.birthday ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //card with appoiment information
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                shadowColor: Colors.green.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text("Datos de la cita",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.calendar_month)
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Lugar: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.appoinmentPlace ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Fecha: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.appoinmentDate ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Hora: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.appoinmentHour ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Observacion: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.appoinmentObservation ?? ""),
                        ],
                      ),
                      //status
                      Row(
                        children: [
                          const Text("Estado: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("${appoiment.appoinmentStatus}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //card with doctor information
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                shadowColor: Colors.blue.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text("Datos del Doctor",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.medical_services),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text("Doctor: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              "${appoiment.doctor?.name ?? ""} ${appoiment.doctor?.lastName ?? ""}"),
                        ],
                      ),
                      //Cedula
                      Row(
                        children: [
                          const Text("Cedula" ": ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.doctor?.dni.toString() ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Especialidad: " ": ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(appoiment.doctor?.specialty ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Editar // Eliminar buttons with icons
            ],
          ),
        ),
      ),
    );
  }
}
