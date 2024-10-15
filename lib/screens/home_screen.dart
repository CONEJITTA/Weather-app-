import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // Fondo
          Positioned.fill(
            child: Image.network(
              'https://i.giphy.com/HnDTs1QpvtCFi.webp',
              fit: BoxFit.cover,
            ),
          ),
          // Capa de opacidad para mayor contraste
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Descripción del clima
                const Text(
                  'Mostly Cloudy',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 10),
                // Temperatura actual
                const Text(
                  '14°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15), // Fondo transparente
                    borderRadius: BorderRadius.circular(40), // Forma de óvalo
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomNavButton(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=Q82WjgdMEzoU&format=png&color=000000',
                        label: 'Location',
                        onPressed: () {
                          Navigator.pushNamed(context, '/location');
                        },
                      ),
                      BottomNavButton(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=PwHEPRMlRd4a&format=png&color=000000',
                        label: 'Forecast',
                        onPressed: () {
                          Navigator.pushNamed(context, '/forecast');
                        },
                      ),
                      BottomNavButton(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=1AfLv3KbfVba&format=png&color=000000',
                        label: 'Alerts',
                        onPressed: () {
                          Navigator.pushNamed(context, '/alerts');
                        },
                      ),
                      BottomNavButton(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=rMF7T4f4fwKw&format=png&color=000000',
                        label: 'Locations Saved',
                        onPressed: () {
                          Navigator.pushNamed(context, '/searched_locations');
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
