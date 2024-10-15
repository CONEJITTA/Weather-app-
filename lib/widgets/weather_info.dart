import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String iconUrl; 
  final String value;

  const WeatherInfo({super.key, required this.iconUrl, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        children: [
          Image.network(iconUrl,
              width: 40, height: 40), 

          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
