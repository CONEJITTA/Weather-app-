import 'package:flutter/material.dart';
import '../widgets/alert_details.dart'; // Importamos el widget separado

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          'Alerta Meteorológica',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExd245b3JoaXZybXE0M3hyb3MyZmFiM2V2cTRiaWNrdHV4c29sZWprYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/U4FkC2VqpeNRHjTDQ5/giphy.webp',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.network(
                    'https://cdn.icon-icons.com/icons2/145/PNG/256/alert_21476.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Alerta Meteorológica',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tormenta eléctrica severa en las próximas horas.',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pronóstico de la tormenta',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),                  const AlertDetails(), 
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
