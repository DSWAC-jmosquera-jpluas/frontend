import 'package:citasmedicas/src/home_patient/home_patient_controller.dart';
import 'package:citasmedicas/tools/size_config.dart';
import 'package:citasmedicas/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePatientView extends ConsumerWidget {
  const HomePatientView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homePatientProvider);
    SizeConfig().init(context);
    return Scaffold(
      //Personalized AppBar
      appBar: AppBar(
        title: const Text("Citas Médicas"),
        centerTitle: true,
        actions: const [],
      ),
      body: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gestor de Citas Médicas',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Consulta de citas médicas',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              //input
              TextFormField(
                controller: controller.appoimentInput,
                decoration: const InputDecoration(
                  labelText: "Código de cita",
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Consultar',
                  onTap: () {
                    controller.getAppoiment(context);
                  }),
            ],
          )),
        ],
      ),
    );
  }
}
