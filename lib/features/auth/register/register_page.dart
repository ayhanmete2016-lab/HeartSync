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

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Checkbox(
                    value: acceptTerms,
                    onChanged: null,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Devam ederek aşağıdaki belgeleri kabul etmiş olursunuz.",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 12),

                        InkWell(
                          onTap: () async {

                            final result =
                                await Navigator.pushNamed(
                              context,
                              AppRouter.terms,
                            );

                            if (result == true) {
                              setState(() {
                                termsAccepted = true;
                              });
                            }

                          },

                          child: Text(
                            termsAccepted
                                ? "✅ Kullanım Koşulları"
                                : "📄 Kullanım Koşulları",
                            style: const TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        InkWell(
                          onTap: () async {

                            final result =
                                await Navigator.pushNamed(
                              context,
                              AppRouter.privacy,
                            );

                            if (result == true) {
                              setState(() {
                                privacyAccepted = true;
                              });
                            }

                          },

                          child: Text(
                            privacyAccepted
                                ? "✅ Gizlilik Politikası"
                                : "🔒 Gizlilik Politikası",
                            style: const TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              HeartButton(
                text: "❤️ Hesap Oluştur",

                onPressed: acceptTerms
                    ? () {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Firebase bağlantısı sonraki sürümde eklenecek.",
                            ),
                          ),
                        );

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