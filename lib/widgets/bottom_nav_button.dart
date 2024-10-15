
import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final String iconUrl; 
  final String label;
  final VoidCallback onPressed;

  const BottomNavButton({
    super.key,
    required this.iconUrl,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.network(
              iconUrl,
              width: 40,
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
