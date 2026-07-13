/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
auth_service.dart

Versiyon:
0.4.0

Görevi:
Firebase Authentication işlemlerini yönetir.

İleride;
• Google Login
• Apple Login
• Şifre Sıfırlama
• Email Doğrulama
• Telefon Doğrulama

buraya eklenecek.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Aktif kullanıcı
  static User? get currentUser => _auth.currentUser;

  /// Oturum dinleyici
  static Stream<User?> get authStateChanges =>
      _auth.authStateChanges();

  /// Email ile kayıt ol
  static Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Email ile giriş yap
  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Çıkış
  static Future<void> logout() async {
    await _auth.signOut();
  }
}