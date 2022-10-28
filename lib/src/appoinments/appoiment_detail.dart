import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/src/appoinments/appoinments_controller.dart';
import 'package:citasmedicas/src/appoinments/edit_appoiment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppoimentDetail extends StatelessWidget {
  final Appoiment appoiment;

  const AppoimentDetail({Key? key, required this.appoiment}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AppoimentEdit(appoiment: appoiment)));
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Editar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      //Modal para confirmar la eliminacion
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Eliminar cita"),
                                content: const Text(
                                    "¿Esta seguro que desea eliminar esta cita?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  Consumer(builder: (context, watch, child) {
                                    final appoimentController =
                                        watch.watch(appoinmentsProvider);

                                    return TextButton(
                                      onPressed: () async {
                                        var status = await appoimentController
                                            .deleteAppoiment(appoiment);

                                        if (status) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "No se pudo eliminar la cita"),
                                          ));
                                        }
                                      },
                                      child: const Text("Eliminar"),
                                    );
                                  })
                                ]);
                          });
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Eliminar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
