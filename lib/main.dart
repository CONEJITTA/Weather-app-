import 'package:flutter/material.dart';
import 'routes/app_routes.dart'; // Importamos las rutas definidas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Cambiamos la ruta inicial al login
      routes: appRoutes, // Usamos el mapa de rutas desde app_routes.dart
    );
  }
}
