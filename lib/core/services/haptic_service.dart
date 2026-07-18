import 'package:vibration/vibration.dart';

class HapticService {
  HapticService._();

  /// Hafif "el tutma" titreşimi
  static Future<void> triggerHandHoldVibration() async {
    final canVibrate = await Vibration.hasVibrator();

    if (!canVibrate) return;

    await Vibration.vibrate(
      duration: 100,
      pattern: [
        50,
        80,
        50,
        80,
        50,
        80,
        50,
        80,
        100,
        80,
        50,
        80,
        50,
        80,
        50,
        80,
      ],
    );
  }

  /// Hafif bildirim titreşimi
  static Future<void> triggerNotificationVibration() async {
    final canVibrate = await Vibration.hasVibrator();

    if (!canVibrate) return;

    await Vibration.vibrate(
      duration: 200,
    );
  }

  /// Onay titreşimi
  static Future<void> triggerConfirmationVibration() async {
    final canVibrate = await Vibration.hasVibrator();

    if (!canVibrate) return;

    await Vibration.vibrate(
      pattern: [50, 100, 50, 100],
    );
  }
}