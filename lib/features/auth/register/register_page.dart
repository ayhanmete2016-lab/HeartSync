/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
register_page.dart

Versiyon:
0.2.2

Görevi:
• Kullanıcı kayıt ekranı
• Ad Soyad
• Email
• Şifre
• Şifre Tekrar
• Hesap Oluştur

NOT:
Bu sürümde sadece arayüz hazırlanmıştır.
Firebase bağlantısı daha sonra eklenecektir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Hesap Oluştur"),
      ),

      body: const Center(
        child: Text(
          "Register Screen\n(Hazırlanıyor)",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}