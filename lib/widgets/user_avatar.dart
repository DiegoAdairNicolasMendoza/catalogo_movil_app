import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double radio;

  const UserAvatar({super.key, this.radio = 40});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radio,
      backgroundColor: const Color(0xFF1E293B),
      child: Icon(Icons.person, size: radio, color: Colors.white),
    );
  }
}
