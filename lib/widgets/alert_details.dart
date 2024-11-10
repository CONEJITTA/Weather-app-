import 'package:flutter/material.dart';

class AlertDetails extends StatelessWidget {
  final Map<String, String> alert;

  const AlertDetails({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alert['headline']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Severidad: ${alert['severity']}",
              style: const TextStyle(color: Colors.white70),
            ),
            Text(
              "Áreas afectadas: ${alert['areas']}",
              style: const TextStyle(color: Colors.white70),
            ),
            Text(
              "Evento: ${alert['event']}",
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Text(
              "Descripción: ${alert['desc']}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Instrucciones: ${alert['instruction']}",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
