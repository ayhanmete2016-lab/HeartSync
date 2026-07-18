import 'package:flutter/material.dart';

import '../models/partner_nickname_model.dart';

class PartnerProfilePage extends StatefulWidget {
  const PartnerProfilePage({super.key});

  @override
  State<PartnerProfilePage> createState() => _PartnerProfilePageState();
}

class _PartnerProfilePageState extends State<PartnerProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Ayşe');
  final TextEditingController _nicknameController = TextEditingController(text: 'Bal Köpüğü');
  final TextEditingController _labelController = TextEditingController(text: 'Sevgilim');

  void _save() {
    final profile = PartnerNicknameModel(
      displayName: _nameController.text.trim().isEmpty ? 'Partner' : _nameController.text.trim(),
      nickname: _nicknameController.text.trim().isEmpty ? 'Sevgilim' : _nicknameController.text.trim(),
      relationshipLabel: _labelController.text.trim().isEmpty ? 'Sevgilim' : _labelController.text.trim(),
    );

    Navigator.pop(context, profile);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Partner Adı & Rolü'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Partnerini nasıl tanımlamak istersin?',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'İsim', labelStyle: TextStyle(color: Colors.white70)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nicknameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Takma ad / özel isim', labelStyle: TextStyle(color: Colors.white70)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _labelController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'İlişki rolü', labelStyle: TextStyle(color: Colors.white70)),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.favorite),
              label: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
