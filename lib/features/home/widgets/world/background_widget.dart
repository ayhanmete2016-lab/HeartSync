import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF081C3A),
            Color(0xFF143A63),
            Color(0xFF245E5E),
            Color(0xFF2F6B4F),
          ],
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 80,
            right: 40,
            child: Icon(
              Icons.nightlight_round,
              color: Colors.white70,
              size: 60,
            ),
          ),

          ...List.generate(
            35,
            (index) => Positioned(
              left: (index * 27 % 360).toDouble(),
              top: (index * 19 % 250).toDouble(),
              child: const Icon(
                Icons.circle,
                color: Colors.white54,
                size: 3,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 170,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3E8E41),
                    Color(0xFF1B5E20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}