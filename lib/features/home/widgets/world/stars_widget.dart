import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        35,
        (index) => Positioned(
          left: (index * 27 % 360).toDouble(),
          top: (index * 19 % 240).toDouble(),
          child: const Icon(
            Icons.circle,
            color: Colors.white54,
            size: 3,
          ),
        ),
      ),
    );
  }
}