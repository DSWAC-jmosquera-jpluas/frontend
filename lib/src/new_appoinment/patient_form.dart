import 'package:citasmedicas/src/new_appoinment/new_appoinments_controller.dart';
import 'package:citasmedicas/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientForm extends ConsumerWidget {
  const PatientForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(newAppoinmentsProvider);
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Datos del Paciente",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5),
          ),
          const Text(
            "Ingrese los datos del Paciente",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //form
          TextFormField(
            controller: controller.patientDniController,
            decoration: const InputDecoration(
              labelText: "Cédula",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.patientNameController,
            decoration: const InputDecoration(
              labelText: "Nombre",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.patientLastNameController,
            decoration: const InputDecoration(
              labelText: "Apellido",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //birthday date
          TextFormField(
            controller: controller.patientBirthdayController,
            decoration: const InputDecoration(
              labelText: "Fecha de Nacimiento",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //button
          CustomButton(
              text: "Siguiente",
              onTap: () {
                controller.setStep(2);
              })
        ],
      ),
    ));
  }
}
