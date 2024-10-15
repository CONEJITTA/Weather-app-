import 'package:flutter/material.dart';
import '../widgets/weekly_forecast_card.dart'; // Importamos el widget reutilizable

class forecast_screen extends StatelessWidget {
  const forecast_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Pronóstico Semanal',
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
              'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYnNnMGR4NmV6bGU4YWVnbXFiYWo4OTJ5dmhwZjhha3E0N3d2aDNweiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LVCdHNPTIY2be/giphy.webp', // Fondo espacial
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
            children: const [
              WeeklyForecastCard(
                day: 'Lunes',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=R1kPtXvDMnWj&format=png&color=000000',
                tempMax: '20°C',
                tempMin: '10°C',
              ),
              WeeklyForecastCard(
                day: 'Martes',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=PwHEPRMlRd4a&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
              WeeklyForecastCard(
                day: 'Miercoles',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=c0Otgmp74zQX&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
              WeeklyForecastCard(
                day: 'Jueves',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=3RZmbgKAmbsY&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
              WeeklyForecastCard(
                day: 'Viernes',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=PwHEPRMlRd4a&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
              WeeklyForecastCard(
                day: 'Sabado',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=PwHEPRMlRd4a&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
              WeeklyForecastCard(
                day: 'Domingo',
                iconUrl:
                    'https://img.icons8.com/?size=100&id=cyZConbteZk9&format=png&color=000000',
                tempMax: '18°C',
                tempMin: '8°C',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
