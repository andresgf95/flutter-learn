import 'package:flutter/material.dart';

import '../models/activity.dart';

class NewActivity extends StatefulWidget {
  const NewActivity({super.key});

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  TextEditingController distanceController = TextEditingController();
  String? selectedActivity;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva actividad"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedActivity,
              hint: const Text('Selecciona una actividad'),
              onChanged: (String? value) {
                setState(() {
                  selectedActivity = value;
                  isButtonEnabled = value != null && value.isNotEmpty;
                });
              },
              items: <String>[
                'Caminar',
                'Correr',
                'Bicicleta',
              ].map<DropdownMenuItem<String>>((String value) {
                IconData icon;
                if (value == 'Correr') {
                  icon = Icons.directions_run;
                } else if (value == 'Bicicleta') {
                  icon = Icons.directions_bike;
                } else {
                  icon = Icons.directions_walk;
                }

                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 8),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              isExpanded: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Distancia',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      var distance = distanceController.text;
                      var activity = Activity(
                        type: selectedActivity!,
                        date: DateTime.now(),
                        distance: double.tryParse(distance) ?? 0,
                      );
                      Navigator.pop(
                        context,
                        activity,
                      );
                    }
                  : null,
              child: const Text("Añadir Actividad"),
            ),
          ],
        ),
      ),
    );
  }
}
