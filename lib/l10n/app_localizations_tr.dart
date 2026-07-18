// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'HeartSync';

  @override
  String get appTitle => 'HeartSync ❤️';

  @override
  String get welcome => 'Hoş Geldin ❤️';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get connect => '❤️ Bağ Kur';

  @override
  String get connecting => 'Bağlanıyor...';

  @override
  String get partnerHeartId => 'Partner Heart ID';

  @override
  String get heartId => 'Heart ID';

  @override
  String get noPartner => 'Henüz bir partner bağlı değil.';

  @override
  String get waitingApproval => 'Karşı tarafın onayı bekleniyor.';

  @override
  String get requestSent => 'Bağlantı isteğin gönderildi.';

  @override
  String get requestSentWaiting => '❤️ Bağlantı isteği gönderildi. Karşı tarafın onayı bekleniyor.';

  @override
  String get newConnectionRequest => '❤️ Yeni Bağlantı İsteği';

  @override
  String get partnerConnected => '❤️ Partner başarıyla bağlandı.';

  @override
  String get accept => 'Kabul Et';

  @override
  String get reject => 'Reddet';

  @override
  String get requestRejected => 'Bağlantı isteği reddedildi.';

  @override
  String get viewTree => 'Ağacı Gör';

  @override
  String get memories => 'Anılar';

  @override
  String get customizePartner => 'Partnerini Kişiselleştir';

  @override
  String get premium => 'Premium Deneyimi';

  @override
  String get enterHeartId => 'Lütfen bir Heart ID girin.';

  @override
  String get addMemory => 'Yeni Anı';

  @override
  String get addMemoryDescription => 'Yeni bir anı oluştur.';

  @override
  String get memoryDetail => 'Anı Detayı';

  @override
  String get memoryDetailDescription => 'Bu anının ayrıntıları burada görüntülenir.';

  @override
  String get editMemory => 'Anıyı Düzenle';

  @override
  String get editMemoryDescription => 'Bu anıyı düzenleyebilirsiniz.';

  @override
  String get noMemories => 'Henüz anı eklenmedi.';

  @override
  String get createMemory => 'Anı Oluştur';

  @override
  String get noPartnerInfo => 'Partnerin olmasa bile anı biriktirebilir, günlük tutabilir ve bu alanı kendin için anlamlı hale getirebilirsin.';

  @override
  String get futureMemoriesTitle => '🌱 Gelecekteki Anılarım';

  @override
  String get futureMemoriesInfo => 'Partnerin olmasa bile bugünden itibaren anılarını, düşüncelerini, şiirlerini ve hislerini biriktirebilirsin.\n\nBir gün hayatına biri girdiğinde istersen onunla paylaşabileceksin.';

  @override
  String get heartIdNotFound => 'Heart ID bulunamadı.';

  @override
  String get cannotPairWithSelf => 'Kendinle eşleşemezsin.';

  @override
  String get pendingRequestExists => 'Zaten bekleyen bağlantı isteğin var.';

  @override
  String get unknownError => 'Bilinmeyen hata oluştu.';

  @override
  String get sendNotification => 'Send Notification';

  @override
  String get leaveFeeling => 'Leave a feeling for your partner.';

  @override
  String get sendSilently => 'Send Silently';

  @override
  String get messageType => 'Message Type';

  @override
  String get send => 'Send';

  @override
  String get notificationTitle => 'Notification';

  @override
  String get silentNotificationTitle => 'Silent Message';

  @override
  String get notificationSent => 'Message sent.';

  @override
  String get silentMessageDefault => 'A silent message has been left.';

  @override
  String get visibleMessageDefault => 'A message has been left.';
}
