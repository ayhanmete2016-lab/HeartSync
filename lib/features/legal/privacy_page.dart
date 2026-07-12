/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
privacy_page.dart

Versiyon:
0.3.2

Görevi:
Gizlilik Politikası ekranı.

İleride:
• Markdown desteği
• Çoklu dil
• KVKK / GDPR güncellemeleri

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Gizlilik Politikası"),
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
                        "HeartSync Gizlilik Politikası",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        """
HeartSync kullanıcı gizliliğine önem verir.

• Kişisel bilgileriniz yalnızca hizmet sunmak amacıyla kullanılır.

• Verileriniz güvenli şekilde saklanmaya çalışılır.

• Hesabınızı istediğiniz zaman silebilirsiniz.

• Uygulama, güvenlik ve performans amacıyla teknik veriler toplayabilir.

• Hiçbir internet tabanlı sistem %100 güvenlik garantisi veremez.

Detaylı Gizlilik Politikası ilerleyen sürümlerde uygulama içerisinde ve resmi internet sitesinde yayımlanacaktır.
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
                  child: const Text("Kabul Ediyorum"),
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
                  child: const Text("Geri Dön"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}