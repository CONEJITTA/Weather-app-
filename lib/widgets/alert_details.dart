import 'package:flutter/material.dart';

class AlertDetails extends StatelessWidget {
  const AlertDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inicio: Hoy, 3:00 PM',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Duración estimada: 2 horas',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Intensidad: Alta - Se esperan vientos fuertes y granizo.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Consejos: Permanezca bajo techo, evite áreas al aire libre.',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
