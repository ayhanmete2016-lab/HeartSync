/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
terms_page.dart

Versiyon:
0.3.3

Görevi:
Kullanım Koşulları ekranı.

İleride:
• Markdown desteği
• Çoklu dil
• Versiyon takibi

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Kullanım Koşulları"),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "HeartSync Kullanım Koşulları",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        """
HeartSync, kullanıcılar arasında güvenli ve olumlu bir iletişim deneyimi sunmayı amaçlar.

Bu uygulamayı kullanarak Kullanım Koşullarını kabul etmiş olursunuz.

• Hesabınızı güvenli tutmak sizin sorumluluğunuzdadır.

• Başkalarının hesaplarını kullanamazsınız.

• Sisteme zarar verecek davranışlarda bulunamazsınız.

• Hizmet zaman zaman bakım nedeniyle geçici olarak durabilir.

• HeartSync hiçbir zaman psikolojik, tıbbi veya hukuki danışmanlık hizmeti vermez.

Detaylı sözleşme ilerleyen sürümlerde uygulama içerisinde ve resmi internet sitesinde yayımlanacaktır.
""",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    "✅ Kabul Ediyorum",
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    "❌ Reddediyorum",
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