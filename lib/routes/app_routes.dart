import 'package:flutter/material.dart';
import '../screens/home_screen.dart'; //Pantalla de Inicio (Home)
import '../screens/location_screen.dart'; //Pantalla de Ubicación
import '../screens/forecast_screen.dart'; //Pantalla de Pronóstico
import '../screens/alerts_screen.dart'; // Pantalla de Alertas
import '../screens/searched_locations_screen.dart'; // Pantalla de Ubicaciones Buscadas
import '../screens/login_screen.dart'; // Pantalla de Login
import '../screens/register_screen.dart'; // Pantalla de Registro

// Definimos las rutas en un mapa de forma centralizada
final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/location': (context) => location_screen(),
  '/forecast': (context) => const forecast_screen(),
  '/alerts': (context) => const AlertsScreen(),
  '/searched_locations': (context) => SearchedLocationsScreen(),
};
