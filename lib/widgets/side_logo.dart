import 'package:flutter/material.dart';

class SideLogo extends StatelessWidget {
  const SideLogo({
    this.onTap,
    super.key,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'AM',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber),
      ),
    );
  }
}
