import 'package:flutter/material.dart';

class BackGroundGradient extends StatelessWidget {
  const BackGroundGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color_1 = Color(0x30A2C5);
    final color_2 = Color(0xFFFFFF);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color_1, color_2])
      ),
    );
  }
}
