import 'package:flutter/material.dart';

class EditMemoryPage extends StatelessWidget {
  const EditMemoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anıyı Düzenle'),
      ),
      body: const Center(
        child: Text('Anı düzenleme ekranı'),
      ),
    );
  }
}