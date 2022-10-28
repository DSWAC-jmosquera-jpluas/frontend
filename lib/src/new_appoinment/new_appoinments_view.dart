import 'package:citasmedicas/src/new_appoinment/new_appoinments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewAppoinmentView extends ConsumerWidget {
  const NewAppoinmentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(newAppoinmentsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nueva Cita Medica"),
        ),
        //body step form
        body: Container(
          child: controller.obtainViewForStep(),
        ));
  }
}
