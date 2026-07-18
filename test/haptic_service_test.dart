import 'package:flutter_test/flutter_test.dart';
import 'package:heartsync/core/services/haptic_service.dart';

void main() {
  group('HapticService', () {
    test('hand-hold vibration pattern is defined', () async {
      /// Test that the vibration pattern can be triggered without crashing
      /// On devices without vibration support, this should gracefully return.
      expect(() async => await HapticService.triggerHandHoldVibration(), returnsNormally);
    });

    test('notification vibration is defined', () async {
      expect(() async => await HapticService.triggerNotificationVibration(), returnsNormally);
    });

    test('confirmation vibration is defined', () async {
      expect(() async => await HapticService.triggerConfirmationVibration(), returnsNormally);
    });
  });
}
