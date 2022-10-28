import 'package:citasmedicas/src/appoinments/appoiment_item.dart';
import 'package:citasmedicas/src/appoinments/appoinments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppoinmentsView extends ConsumerWidget {
  const AppoinmentsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(appoinmentsProvider);

    controller.getAppoimentsList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Citas Medicas"),
      ),
      body: controller.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.appoinmentsList.length,
              itemBuilder: (context, index) {
                return AppoimentItem(
                    appoiment: controller.appoinmentsList[index]);
              }),
    );
  }
}
