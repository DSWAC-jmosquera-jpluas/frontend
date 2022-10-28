import 'package:citasmedicas/navigation/routes_name.dart';
import 'package:citasmedicas/src/new_appoinment/new_appoinments_controller.dart';
import 'package:citasmedicas/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppoimentForm extends ConsumerWidget {
  const AppoimentForm({super.key});

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
            "Datos de la Cita Medica",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5),
          ),
          const Text(
            "Ingrese los datos  de la Cita Medica",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //form
          TextFormField(
            controller: controller.appoinmentDateController,
            decoration: const InputDecoration(
              labelText: "Fecha",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: controller.appoinmentPlaceController,
            decoration: const InputDecoration(
              labelText: "Lugar",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //hour
          TextFormField(
            controller: controller.appoinmentHourController,
            decoration: const InputDecoration(
              labelText: "Hora",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //observation
          TextFormField(
            controller: controller.appoinmentObservationController,
            decoration: const InputDecoration(
              labelText: "Observacion",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //button
          CustomButton(
              text: "Enviar",
              onTap: () async {
                var status = await controller.saveAppoinment();
                print("status: $status");
                if (status) {
                  controller.clearControllers();
                  controller.setStep(0);

                  Navigator.pushNamed(context, RouteNames.appoinments);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Error al guardar la cita medica"),
                    ),
                  );
                }
              })
        ],
      ),
    ));
  }
}
