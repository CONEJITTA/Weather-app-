import 'package:flutter/material.dart';
import '../widgets/location_card.dart'; 

class SearchedLocationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recentLocations = [
    {'location': 'Itagüí', 'temperature': '23°C', 'weather': 'Soleado'},
    {'location': 'Medellín', 'temperature': '22°C', 'weather': 'Nublado'},
    {'location': 'Bogotá', 'temperature': '18°C', 'weather': 'Lluvia ligera'},
    {'location': 'Cali', 'temperature': '30°C', 'weather': 'Soleado'},
    {'location': 'Cartagena', 'temperature': '32°C', 'weather': 'Húmedo'}
  ];
  SearchedLocationsScreen(
      {super.key}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Ubicaciones Guardadas',
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
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
        
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ubicaciones Recientes',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: recentLocations.map((locationData) {
                      return LocationCard(
                        location: locationData['location'],
                        temperature: locationData['temperature'],
                        weather: locationData['weather'],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
