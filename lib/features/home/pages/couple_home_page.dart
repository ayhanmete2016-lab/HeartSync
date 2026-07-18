/*
══════════════════════════════════════════════════════════════

HeartSync

File:
couple_home_page.dart

Version:
1.2.1

Purpose:
• Couple Home
• Load Relationship
• Load Partner
• World Screen

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../controllers/couple_home_controller.dart';
import '../widgets/world/world_widget.dart';

class CoupleHomePage extends StatefulWidget {
  const CoupleHomePage({super.key});

  @override
  State<CoupleHomePage> createState() => _CoupleHomePageState();
}

class _CoupleHomePageState extends State<CoupleHomePage> {
  final CoupleHomeController controller = CoupleHomeController();

  Map<String, dynamic>? relationship;
  Map<String, dynamic>? partner;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    relationship = await controller.loadRelationship();
    partner = await controller.loadPartner();

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("HeartSync ❤️"),
      ),
      body: SafeArea(
        child: Center(
          child: WorldWidget(
            relationship: relationship,
            partner: partner,
          ),
        ),
      ),
    );
  }
}