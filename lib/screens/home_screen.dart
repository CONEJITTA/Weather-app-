import 'package:flutter/material.dart';
import 'package:myapp/utils/weather_service.dart';
import 'package:myapp/widgets/bottom_nav_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  double? _currentTemperature;
  String? _description = '';
  String? _iconUrl = '';
  String city = 'Bogota';

  @override
  void initState() {
    super.initState();
    _fetchCurrentWeather();
  }

  Future<void> _fetchCurrentWeather() async {
    final weatherData = await _weatherService.getCurrentWeather(city);
    setState(() {
      if (weatherData != null) {
        _currentTemperature = weatherData['temperature'];
        _description = weatherData['description'];
        _iconUrl = weatherData['iconUrl'];
      }
    });
  }

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
                // Información del clima
                if (_currentTemperature != null && _description != null)
                  Column(
                    children: [
                      Text(
                        _description!,
                        style: const TextStyle(
                          color: Color.fromARGB(179, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (_iconUrl != null)
                        Image.network(
                          _iconUrl!,
                          width: 80,
                          height: 80,
                        ),
                      const SizedBox(height: 10),
                      Text(
                        '${_currentTemperature!.toStringAsFixed(1)}°C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        city,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  )
                else
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                // Botones de navegación
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(40),
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
