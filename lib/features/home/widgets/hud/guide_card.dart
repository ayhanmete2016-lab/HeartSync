import 'package:flutter/material.dart';

class GuideWidget extends StatelessWidget {
  const GuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.help_outline),
      ),
    );
  }
}