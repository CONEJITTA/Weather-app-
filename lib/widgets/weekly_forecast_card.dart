import 'package:flutter/material.dart';

class WeeklyForecastCard extends StatelessWidget {
  final String day;
  final String iconUrl; 
  final String tempMax;
  final String tempMin;

  const WeeklyForecastCard({super.key, 
    required this.day,
    required this.iconUrl,
    required this.tempMax,
    required this.tempMin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
      child: Card(
        color: Colors.black54.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 
              Text(
                day,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),      
              Image.network(
                iconUrl,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'Máx: $tempMax',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Mín: $tempMin',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
