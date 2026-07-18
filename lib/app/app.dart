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
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/providers/locale_provider.dart';
import '../l10n/app_localizations.dart';

import 'app_config.dart';
import 'router.dart';
import 'theme.dart';

class HeartSyncApp extends StatefulWidget {
  const HeartSyncApp({super.key});

  @override
  State<HeartSyncApp> createState() => _HeartSyncAppState();
}

class _HeartSyncAppState extends State<HeartSyncApp> {
  final localeProvider = LocaleProvider();

  @override
  void initState() {
    super.initState();
    loadLocale();
  }

  Future<void> loadLocale() async {
    await localeProvider.load();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,

      debugShowCheckedModeBanner: false,

      theme: AppTheme.darkTheme,

      locale: localeProvider.locale,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: AppLocalizations.supportedLocales,

      localeResolutionCallback: (
        locale,
        supportedLocales,
      ) {
        if (locale == null) {
          return supportedLocales.first;
        }

        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },

      initialRoute: AppRouter.splash,

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}