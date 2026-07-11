/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
login_page.dart

Versiyon:
0.2.0

Görevi:
• Kullanıcı giriş ekranı
• Email
• Şifre
• Giriş Butonu
• Kayıt Ol
• Şifremi Unuttum

NOT:
Şimdilik sadece arayüz hazırlanıyor.
Firebase bağlantısı daha sonra eklenecek.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Giriş Yap"),
      ),

      body: const Center(
        child: Text(
          "Login Screen\n(Hazırlanıyor)",
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