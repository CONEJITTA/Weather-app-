import 'package:flutter/material.dart';
import '../utils/global_variables.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String successMessage = '';
  String errorMessage = '';

  // Función de registro
  void register() {
    if (email.isNotEmpty && password == confirmPassword) {
      setState(() {
        registeredEmail = email;
        registeredPassword = password;
        successMessage = 'Usuario registrado correctamente';
        errorMessage = ''; 
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context); 
      });
    } else {
      setState(() {
        successMessage = ''; 
        errorMessage = 'Las contraseñas no coinciden o el email es inválido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // Fondo GIF
          Positioned.fill(
            child: Image.network(
              'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWs2dmVleXVxNjNraXZvcjlvY2w4eHVnOGc1Ym4zYmN4NmxwYWZ4ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JDPsfIOg1uL6M/giphy.webp',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Registro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField(
                  hintText: 'Correo Electrónico',
                  icon: Icons.email,
                  obscureText: false,
                  onChanged: (value) => setState(() => email = value),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (value) => setState(() => password = value),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  hintText: 'Confirmar Contraseña',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  onChanged: (value) =>
                      setState(() => confirmPassword = value),
                ),
                const SizedBox(height: 20),
                
                ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Registrarse'),
                ),
                const SizedBox(height: 10),
                if (successMessage.isNotEmpty)
                  Text(
                    successMessage,
                    style: const TextStyle(
                        color: Colors.greenAccent, fontSize: 16),
                  ),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(
                        color: Colors.redAccent, fontSize: 16),
                  ),
                const SizedBox(height: 10),
                // Botón para ir al Login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '¿Ya tienes cuenta? Inicia sesión',
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
