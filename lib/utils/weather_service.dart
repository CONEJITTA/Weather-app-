import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();
  final String apiKey = '5fd742bd96bf4ba188e192440240911';

  factory WeatherService() {
    return _instance;
  }
  WeatherService._internal();

  Future<Map<String, dynamic>?> getCurrentWeather(String city) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'temperature': data['current']['temp_c'],
          'description': data['current']['condition']['text'],
          'iconUrl': 'https:${data['current']['condition']['icon']}',
        };
      } else {
        print('Error al obtener los datos: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
