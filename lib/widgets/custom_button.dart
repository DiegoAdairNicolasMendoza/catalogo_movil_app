import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.texto,
    this.icono,
    required this.onPressed,
    this.color = const Color(0xFF1E293B),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icono != null) ...[
            Icon(icono, size: 18),
            const SizedBox(width: 8),
          ],
          Text(texto, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
