import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final Color color;
  final double size;

  const MySquare({
    super.key,
    this.color = Colors.blue, // Default color
    this.size = 100.0, // Default size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
    );
  }
}
