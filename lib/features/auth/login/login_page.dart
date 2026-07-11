/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
login_page.dart

Versiyon:
0.2.2

Görevi:
• Kullanıcı giriş ekranı
• Email girişi
• Şifre girişi
• Giriş Yap butonu
• Google ile giriş (hazırlık)
• Şifremi Unuttum
• Hesap Oluştur

NOT:
Bu sürümde sadece arayüz hazırlanmıştır.
Firebase bağlantısı bir sonraki sürümde eklenecektir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../../../shared/widgets/heart_button.dart';
import '../../../shared/widgets/heart_logo.dart';
import '../../../shared/widgets/heart_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /// Email kutusu
  final TextEditingController emailController =
      TextEditingController();

  /// Şifre kutusu
  final TextEditingController passwordController =
      TextEditingController();

  /// Şifre görünürlüğü
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              const SizedBox(height: 20),

              /// ❤️ Logo
              const Center(
                child: HeartLogo(size: 110),
              ),

              const SizedBox(height: 25),

              /// Başlık
              const Center(
                child: Text(
                  "Tekrar Hoş Geldin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Kalbin seni bekliyor ❤️",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 45),

              /// Email
              HeartTextField(
                controller: emailController,
                hint: "E-posta",
              ),

              const SizedBox(height: 20),

              /// Şifre
              TextField(

                controller: passwordController,

                obscureText: obscurePassword,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(

                  hintText: "Şifre",

                  suffixIcon: IconButton(

                    onPressed: () {

                      setState(() {

                        obscurePassword =
                            !obscurePassword;

                      });

                    },

                    icon: Icon(

                      obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,

                    ),

                  ),

                ),

              ),

              const SizedBox(height: 35),

              /// Giriş Yap
              HeartButton(

                text: "❤️ Giriş Yap",

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content: Text(
                        "Firebase bağlantısı sonraki sürümde eklenecek.",
                      ),

                    ),

                  );

                },

              ),

              const SizedBox(height: 18),

              /// Google
              OutlinedButton(

                onPressed: () {},

                child: const Text(
                  "Google ile Devam Et",
                ),

              ),

              const SizedBox(height: 30),

              Center(

                child: TextButton(

                  onPressed: () {},

                  child: const Text(
                    "Şifremi Unuttum",
                  ),

                ),

              ),

              Center(

                child: TextButton(

                  onPressed: () {},

                  child: const Text(
                    "Hesabın yok mu? Hesap Oluştur",
                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}