import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/weather_info.dart';

class location_screen extends StatefulWidget {
  const location_screen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<location_screen> {
  // Datos que vamos a consumir
  String temperature = '';
  String humidity = '';
  String windSpeed = '';

  // API Key de WeatherAPI
  final String apiKey = '5fd742bd96bf4ba188e192440240911';
  final String city = 'Bogotá';

  // Método para obtener los datos del clima
  Future<void> fetchWeatherData() async {
    final url =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          temperature = '${data['current']['temp_c']}°C';
          humidity = '${data['current']['humidity']}%';
          windSpeed = '${data['current']['wind_kph']} km/h';
        });
      } else {
        print('Error al obtener los datos del clima: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al hacer la solicitud: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

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
          // Fondo animado
          Positioned.fill(
            child: Image.network(
              'https://i.giphy.com/HnDTs1QpvtCFi.webp',
              fit: BoxFit.cover,
            ),
          ),
          // Opacidad para el fondo
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  // Icono del clima
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      'https://img.icons8.com/?size=100&id=Q82WjgdMEzoU&format=png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Temperatura actual
                  Text(
                    temperature.isEmpty ? 'Cargando...' : temperature,
                    style: const TextStyle(
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
                  // Información adicional del clima
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfo(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=LVlw7ED5WjlZ&format=png&color=000000',
                        value: humidity.isEmpty ? 'Cargando...' : 'Humedad $humidity',
                      ),
                      WeatherInfo(
                        iconUrl:
                            'https://img.icons8.com/?size=100&id=oMdcU92GFKlj&format=png&color=000000',
                        value: windSpeed.isEmpty ? 'Cargando...' : 'Viento $windSpeed',
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Información adicional (Calidad del aire)
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
