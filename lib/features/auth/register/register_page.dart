/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
register_page.dart

Versiyon:
0.3.1

Görevi:
• Yeni kullanıcı kayıt ekranı
• Ad Soyad
• Email
• Şifre
• Şifre Tekrar
• Kullanım Koşulları
• Gizlilik Politikası
• Firebase'e hazır yapı

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../../../shared/widgets/heart_button.dart';
import '../../../shared/widgets/heart_logo.dart';
import '../../../shared/widgets/heart_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';
import '../../user/models/user_model.dart';
import '../../user/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool termsAccepted = false;
  bool privacyAccepted = false;

  bool get acceptTerms => termsAccepted && privacyAccepted;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


Future<void> register() async {

  if (!acceptTerms) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Lütfen kullanım koşullarını kabul edin."),
      ),
    );
    return;
  }

  if (passwordController.text != confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Şifreler eşleşmiyor."),
      ),
    );
    return;
  }

  try {
    final credential = await AuthService.register(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final user = UserModel(
      uid: credential.user!.uid,
      fullName: nameController.text.trim(),
      email: emailController.text.trim(),
      premium: false,
      premiumType: "",
      partnerUid: "",
      pairCode: "",
      heartLevel: 100,
      streak: 0,
      language: "tr",
      notifications: true,
      isOnline: true,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );

    await UserService.createUser(user);

if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Kayıt başarılı ❤️"),
  ),
);

Navigator.pushNamedAndRemoveUntil(
  context,
  AppRouter.login,
  (route) => false,
);
  } on FirebaseAuthException catch (e) {

    String message = "Bir hata oluştu.";

    switch (e.code) {
      case "email-already-in-use":
        message = "Bu e-posta zaten kullanılıyor.";
        break;

      case "invalid-email":
        message = "Geçersiz e-posta adresi.";
        break;

      case "weak-password":
        message = "Şifre çok zayıf.";
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

              const Center(
                child: HeartLogo(size: 110),
              ),

              const SizedBox(height: 25),

              const Center(
                child: Text(
                  "Hesap Oluştur",
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
                  "HeartSync ailesine hoş geldin ❤️",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              HeartTextField(
                controller: nameController,
                hint: "Ad Soyad",
              ),

              const SizedBox(height: 18),

              HeartTextField(
                controller: emailController,
                hint: "E-posta",
              ),

              const SizedBox(height: 18),

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

              const SizedBox(height: 18),

              TextField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Şifre Tekrar",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword =
                            !obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    const Text(
      "Devam etmek için aşağıdaki sözleşmeleri okuyup kabul etmeniz gerekir.",
      style: TextStyle(
        color: Colors.white70,
      ),
    ),

    const SizedBox(height: 20),

    CheckboxListTile(
      value: termsAccepted,
      activeColor: Colors.green,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text(
        "Kullanım Koşullarını okudum ve kabul ediyorum.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      onChanged: (_) async {

        final result = await Navigator.pushNamed(
          context,
          AppRouter.terms,
        );

        if (result == true) {
          setState(() {
            termsAccepted = true;
          });
        }

      },
    ),

    CheckboxListTile(
      value: privacyAccepted,
      activeColor: Colors.green,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text(
        "Gizlilik Politikasını okudum ve kabul ediyorum.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      onChanged: (_) async {

        final result = await Navigator.pushNamed(
          context,
          AppRouter.privacy,
        );

        if (result == true) {
          setState(() {
            privacyAccepted = true;
          });
        }

      },
    ),

  ],
),
              const SizedBox(height: 30),

          HeartButton(
  text: "❤️ Hesap Oluştur",
  onPressed: acceptTerms
      ? () async {
          await register();
        }
      : null,
),

              const SizedBox(height: 15),

              OutlinedButton(
                onPressed: () {},
                child: const Text("Google ile Devam Et"),
              ),

              const SizedBox(height: 25),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Zaten hesabın var mı? Giriş Yap",
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