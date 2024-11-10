import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/weekly_forecast_card.dart';

class forecast_screen extends StatefulWidget {
  const forecast_screen({super.key});

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<forecast_screen> {
  List<Map<String, dynamic>> forecastData = [];

  @override
  void initState() {
    super.initState();
    fetchForecastData();
  }

  Future<void> fetchForecastData() async {
    const String apiKey = '5fd742bd96bf4ba188e192440240911';
    const String apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=Bogotá&days=7&aqi=no&alerts=no';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List forecastDays = data['forecast']['forecastday'];

      setState(() {
        forecastData = forecastDays.map((day) {
          return {
            'day': day['date'] ?? '',
            'tempMax': '${day['day']['maxtemp_c'] ?? ''}°C',
            'tempMin': '${day['day']['mintemp_c'] ?? ''}°C',
            'iconUrl': 'https:${day['day']['condition']['icon'] ?? ''}',
          };
        }).toList();
      });
    } else {
      // Manejo de errores
      print('Error al obtener los datos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Pronóstico Semanal', style: TextStyle(color: Colors.white)),
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
              'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYnNnMGR4NmV6bGU4YWVnbXFiYWo4OTJ5dmhwZjhha3E0N3d2aDNweiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LVCdHNPTIY2be/giphy.webp',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          PageView(
            scrollDirection: Axis.horizontal,
            children: forecastData.isNotEmpty
                ? forecastData.map((dayData) {
                    return WeeklyForecastCard(
                      day: dayData['day'] ?? '',
                      iconUrl: dayData['iconUrl'] ?? '',
                      tempMax: dayData['tempMax'] ?? '',
                      tempMin: dayData['tempMin'] ?? '',
                    );
                  }).toList()
                : [const Center(child: CircularProgressIndicator())],
          ),
        ],
      ),
    );
  }
}
