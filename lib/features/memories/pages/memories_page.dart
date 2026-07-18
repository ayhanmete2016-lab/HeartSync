import 'package:flutter/material.dart';

class MemoriesPage extends StatelessWidget {
  const MemoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anılar'),
      ),
      body: const Center(
        child: Text(
          'Henüz anı yok.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}