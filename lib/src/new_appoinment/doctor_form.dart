import 'package:citasmedicas/src/new_appoinment/new_appoinments_controller.dart';
import 'package:citasmedicas/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorForm extends ConsumerWidget {
  const DoctorForm({super.key});

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
            "Datos del Doctor",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5),
          ),
          const Text(
            "Ingrese los datos del Doctor",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          //form
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: controller.doctorDniController,
            decoration: const InputDecoration(
              labelText: "Cédula",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.doctorNameController,
            decoration: const InputDecoration(
              labelText: "Nombre",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.doctorLastNameController,
            decoration: const InputDecoration(
              labelText: "Apellido",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.doctorSpecialtyController,
            decoration: const InputDecoration(
              labelText: "Especialidad",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //button
          CustomButton(
              text: "Siguiente",
              onTap: () {
                controller.setStep(1);
              })
        ],
      ),
    ));
  }
}
