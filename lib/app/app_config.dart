/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
app_config.dart

Görevi:
Uygulamanın genel ayarlarını tek yerde toplamak.

Bu dosyada ileride;

• Uygulama adı
• Versiyon
• API adresi
• Firebase ayarları
• Premium ayarları
• Debug seçenekleri

bulunacaktır.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

class AppConfig {
  AppConfig._();

  /// Uygulama adı
  static const String appName = "HeartSync";

  /// İlk versiyon
  static const String version = "0.1.0";

  /// Debug modu
  static const bool debug = true;
}