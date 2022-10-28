import 'package:citasmedicas/models/appoinment.dart';
import 'package:citasmedicas/src/appoinments/appoiment_detail.dart';
import 'package:flutter/material.dart';

class AppoimentItem extends StatelessWidget {
  final Appoiment appoiment;

  const AppoimentItem({Key? key, required this.appoiment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Card with the appoiment information
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      shadowColor: appoiment.appoinmentStatus! ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Cedula: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "${appoiment.patient?.dni} ",
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Paciente: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        "${appoiment.patient?.name} ${appoiment.patient?.lastName}"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Fecha: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(appoiment.appoinmentDate!),
                  ],
                ),
                Row(
                  children: [
                    const Text("Hora: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(appoiment.appoinmentHour!),
                  ],
                ),
                Row(
                  children: [
                    const Text("Observacion: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(appoiment.appoinmentObservation!),
                  ],
                ),
              ],
            ),
            const Spacer(),
            //button para ver mas
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AppoimentDetail(appoiment: appoiment)));
              },
              child: const Text("Ver mas"),
            ),
          ],
        ),
      ),
    );
  }
}
