import 'package:flutter/material.dart';
import '../widgets/weather_info.dart'; // Importamos el widget WeatherInfo

class location_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Ubicación Actual',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Stack(
        children: [
      
          Positioned.fill(
            child: Image.network(
              'https://i.giphy.com/HnDTs1QpvtCFi.webp', 
              fit: BoxFit.cover, 
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), 
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100), 
                  
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                          .withOpacity(0.5), 
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      'https://img.icons8.com/?size=100&id=Q82WjgdMEzoU&format=png', // URL del icono
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '7°C',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Temperatura actual',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfo(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=LVlw7ED5WjlZ&format=png&color=000000', // URL del icono para la humedad
                        value: 'Humedad 70%',
                      ),
                      WeatherInfo(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=oMdcU92GFKlj&format=png&color=000000', // URL del icono para el viento
                        value: 'Viento 10 km/h',
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://img.icons8.com/?size=100&id=RtDA8YDN9Mi9&format=png&color=000000'),
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Calidad del aire: Buena',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Índice de calidad del aire: 30 AQI',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
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
