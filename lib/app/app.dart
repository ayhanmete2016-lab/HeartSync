/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
app.dart

Görevi:
Uygulamanın başlangıç noktası.

Buradan;

• Tema
• Router
• Dil
• Genel ayarlar

yüklenir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import 'app_config.dart';
import 'router.dart';
import 'theme.dart';

class HeartSyncApp extends StatelessWidget {
  const HeartSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,

      debugShowCheckedModeBanner: false,

      theme: AppTheme.darkTheme,

      initialRoute: AppRouter.splash,

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}