import 'package:citasmedicas/navigation/routes_name.dart';
import 'package:citasmedicas/tools/size_config.dart';
import 'package:citasmedicas/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDoctorView extends ConsumerWidget {
  const HomeDoctorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                'Seleccione una opcion',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              CustomButton(
                  text: 'Nueva cita médica',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.newAppoinment);
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Citas medicas',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.appoinments);
                  }),
            ],
          )),
        ],
      ),
    );
  }
}
