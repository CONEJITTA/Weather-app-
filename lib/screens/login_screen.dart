import 'package:flutter/material.dart';
import '../utils/global_variables.dart'; // Importamos las variables globales

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  String errorMessage = '';

  // Proceso login
  void login() {
    if (email == registeredEmail && password == registeredPassword) {
      Navigator.pushReplacementNamed(context, '/home'); // Navega al Home
    } else {
      setState(() {
        errorMessage = 'Correo o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          //Imagen para el fondo, utilizamos gif
          Positioned.fill(
            child: Image.network(
              'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWs2dmVleXVxNjNraXZvcjlvY2w4eHVnOGc1Ym4zYmN4NmxwYWZ4ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JDPsfIOg1uL6M/giphy.webp',
              fit: BoxFit.cover,
            ),
          ),
          //Opacidad
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // Campo de Correo Electrónico
                _buildTextField(
                  hintText: 'Correo Electrónico',
                  icon: Icons.email,
                  obscureText: false,
                  onChanged: (value) => setState(() => email = value),
                ),
                const SizedBox(height: 20),
                // Campo de Contraseña
                _buildTextField(
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (value) => setState(() => password = value),
                ),
                const SizedBox(height: 20),
                // Botón de Inicio de Sesión
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Iniciar Sesión'),
                ),
                const SizedBox(height: 10),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                const SizedBox(height: 10),
                // Botón para Registro
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate aquí',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required bool obscureText,
    required Function(String) onChanged,
  }) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
