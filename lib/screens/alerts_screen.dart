import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/alert_details.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  List<Map<String, String>> alerts = [];
  bool isLoading = true; // Indicador de carga

  @override
  void initState() {
    super.initState();
    fetchAlertData();
  }

  Future<void> fetchAlertData() async {
    const String apiKey = '5fd742bd96bf4ba188e192440240911';
    const String apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=Bogotá&days=7&aqi=no&alerts=yes';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> alertList = data['alerts']['alert'] ?? [];

      setState(() {
        isLoading = false; // Cambiar el estado de carga
        alerts = alertList.map((alert) {
          return {
            'headline': alert['headline']?.toString() ?? '',
            'severity': alert['severity']?.toString() ?? '',
            'areas': alert['areas']?.toString() ?? '',
            'event': alert['event']?.toString() ?? '',
            'desc': alert['desc']?.toString() ?? '',
            'instruction': alert['instruction']?.toString() ?? '',
          };
        }).toList().cast<Map<String, String>>();
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print('Error al obtener las alertas: ${response.statusCode}');
    }
  }

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
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : alerts.isNotEmpty
                  ? SingleChildScrollView(
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
                              'Detalles de la alerta actual:',
                              style: TextStyle(fontSize: 18, color: Colors.white70),
                            ),
                            const SizedBox(height: 30),
                            ...alerts.map((alert) => AlertDetails(alert: alert)),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        'No hay alertas meteorológicas disponibles en este momento.',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
        ],
      ),
    );
  }
}
