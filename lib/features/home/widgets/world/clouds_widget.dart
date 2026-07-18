import 'package:flutter/material.dart';

class CloudsWidget extends StatelessWidget {
  const CloudsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 20,
          child: Icon(
            Icons.cloud,
            color: Colors.white24,
            size: 70,
          ),
        ),
        Positioned(
          top: 80,
          right: 30,
          child: Icon(
            Icons.cloud,
            color: Colors.white30,
            size: 90,
          ),
        ),
      ],
    );
  }
}