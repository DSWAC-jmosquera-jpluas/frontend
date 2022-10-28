import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/src/appoinments/appoinments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppoimentEdit extends ConsumerStatefulWidget {
  final Appoiment appoiment;

  const AppoimentEdit({Key? key, required this.appoiment}) : super(key: key);

  @override
  _AppoimentEditState createState() => _AppoimentEditState();
}

class _AppoimentEditState extends ConsumerState<AppoimentEdit> {
  var controller;
  @override
  void initState() {
    controller = ref.read(appoinmentsProvider.notifier);
    controller.populateFields(widget.appoiment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar cita"),
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
                        height: 20,
                      ),
                      //Doctor
                      TextFormField(
                        controller: controller.doctorDniController,
                        decoration: const InputDecoration(
                          labelText: "Cédula del Doctor",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.doctorNameController,
                        decoration: const InputDecoration(
                          labelText: "Nombre del Doctor",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.doctorLastNameController,
                        decoration: const InputDecoration(
                          labelText: "Apellido del Doctor",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.doctorSpecialtyController,
                        decoration: const InputDecoration(
                          labelText: "Especialidad del Doctor",
                        ),
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
                shadowColor: Colors.amber.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Datos del paciente
                      Row(
                        children: const [
                          Text("Datos del paciente",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.people),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.patientNameController,
                        decoration: const InputDecoration(
                          labelText: "Nombre del paciente",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.patientLastNameController,
                        decoration: const InputDecoration(
                          labelText: "Apellido del paciente",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.patientDniController,
                        decoration: const InputDecoration(
                          labelText: "Cedula del paciente",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.patientBirthdayController,
                        decoration: const InputDecoration(
                          labelText: "Fecha de nacimiento del paciente",
                        ),
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
                shadowColor: Colors.green.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Datos de la cita
                      Row(
                        children: const [
                          Text("Datos de la cita",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.appoinmentPlaceController,
                        decoration: const InputDecoration(
                          labelText: "Lugar de la cita",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.appoinmentDateController,
                        decoration: const InputDecoration(
                          labelText: "Fecha de la cita",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.appoinmentHourController,
                        decoration: const InputDecoration(
                          labelText: "Hora de la cita",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //observaciones
                      TextFormField(
                        controller: controller.appoinmentObservationController,
                        decoration: const InputDecoration(
                          labelText: "Observaciones",
                        ),
                      ),
                      //checkbox de estado
                      Consumer(builder: (context, ref, child) {
                        var controller1 = ref.watch(appoinmentsProvider);
                        return CheckboxListTile(
                          title: const Text("Estado"),
                          value: controller1.statusAppoinment,
                          onChanged: (value) {
                            controller1.setAppoimentStatus(value);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //actualizar cita
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var status =
                        await controller.updateAppoiment(widget.appoiment.id);
                    if (status == true) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error al actualizar la cita"),
                        ),
                      );
                    }
                  },
                  child: const Text("Actualizar cita"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
