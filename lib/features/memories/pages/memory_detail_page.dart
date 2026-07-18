import 'package:flutter/material.dart';

class MemoryDetailPage extends StatelessWidget {
  const MemoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anı Detayı'),
      ),
      body: const Center(
        child: Text('Anı detay ekranı'),
      ),
    );
  }
}