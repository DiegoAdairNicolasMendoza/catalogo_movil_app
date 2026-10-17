import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String mensaje;
  final IconData icono;

  const EmptyStateWidget({
    super.key,
    required this.mensaje,
    this.icono = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono, size: 60, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            mensaje,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
