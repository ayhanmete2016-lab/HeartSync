/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
login_page.dart

Versiyon:
0.3.0

Görevi:
• Firebase Authentication giriş ekranı
• Email
• Şifre
• Firebase Login
• Google Login (Hazırlık)
• Şifremi Unuttum
• Hesap Oluştur

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/router.dart';
import '../../../shared/widgets/heart_button.dart';
import '../../../shared/widgets/heart_logo.dart';
import '../../../shared/widgets/heart_text_field.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen e-posta ve şifre giriniz."),
        ),
      );
      return;
    }

    try {
      await AuthService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Giriş başarılı ❤️"),
        ),
      );

     Navigator.pushNamedAndRemoveUntil(
  context,
  AppRouter.home,
  (route) => false,
);
    } on FirebaseAuthException catch (e) {
      String message = "Bir hata oluştu.";

      switch (e.code) {
        case "user-not-found":
          message = "Bu e-posta ile kayıtlı kullanıcı bulunamadı.";
          break;

        case "wrong-password":
        case "invalid-credential":
          message = "E-posta veya şifre hatalı.";
          break;

        case "invalid-email":
          message = "Geçersiz e-posta adresi.";
          break;

        case "too-many-requests":
          message = "Çok fazla deneme yapıldı. Lütfen daha sonra tekrar deneyin.";
          break;
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {    return Scaffold(
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

              const Center(
                child: HeartLogo(size: 110),
              ),

              const SizedBox(height: 25),

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

              HeartTextField(
                controller: emailController,
                hint: "E-posta",
              ),

              const SizedBox(height: 20),

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
                        obscurePassword = !obscurePassword;
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

              HeartButton(
                text: "❤️ Giriş Yap",
                onPressed: () async {
                  await login();
                },
              ),

              const SizedBox(height: 18),

              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Google ile Devam Et",
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: TextButton(
                  onPressed: () {
                    // Şifremi unuttum
                  },
                  child: const Text(
                    "Şifremi Unuttum",
                  ),
                ),
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.register,
                    );
                  },
                  child: const Text(
                    "Hesabın yok mu? Hesap Oluştur",
                  ),
                ),
              ),            ],
          ),
        ),
      ),
    );
  }
}