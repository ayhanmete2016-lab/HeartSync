// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'HeartSync';

  @override
  String get appTitle => 'HeartSync ❤️';

  @override
  String get welcome => 'Welcome ❤️';

  @override
  String get loading => 'Loading...';

  @override
  String get connect => '❤️ Connect';

  @override
  String get connecting => 'Connecting...';

  @override
  String get partnerHeartId => 'Partner Heart ID';

  @override
  String get heartId => 'Heart ID';

  @override
  String get noPartner => 'No partner connected yet.';

  @override
  String get waitingApproval => 'Waiting for partner approval.';

  @override
  String get requestSent => 'Connection request sent.';

  @override
  String get requestSentWaiting => '❤️ Connection request sent. Waiting for approval.';

  @override
  String get newConnectionRequest => '❤️ New Connection Request';

  @override
  String get partnerConnected => '❤️ Partner successfully connected.';

  @override
  String get accept => 'Accept';

  @override
  String get reject => 'Reject';

  @override
  String get requestRejected => 'Connection request rejected.';

  @override
  String get viewTree => 'View Tree';

  @override
  String get memories => 'Memories';

  @override
  String get customizePartner => 'Customize Partner';

  @override
  String get premium => 'Premium Experience';

  @override
  String get enterHeartId => 'Please enter a Heart ID.';

  @override
  String get addMemory => 'New Memory';

  @override
  String get addMemoryDescription => 'Create a new memory.';

  @override
  String get memoryDetail => 'Memory Details';

  @override
  String get memoryDetailDescription => 'Details of this memory.';

  @override
  String get editMemory => 'Edit Memory';

  @override
  String get editMemoryDescription => 'You can edit this memory.';

  @override
  String get noMemories => 'No memories yet.';

  @override
  String get createMemory => 'Create Memory';

  @override
  String get noPartnerInfo => 'Even without a partner, you can collect memories, keep a diary, and make this space meaningful for yourself.';

  @override
  String get futureMemoriesTitle => '🌱 Future Memories';

  @override
  String get futureMemoriesInfo => 'Even if you don\'t have a partner yet, you can start collecting your memories, thoughts, poems, and feelings from today.\n\nOne day, if someone enters your life, you can choose to share them.';

  @override
  String get heartIdNotFound => 'Heart ID not found.';

  @override
  String get cannotPairWithSelf => 'You cannot pair with yourself.';

  @override
  String get pendingRequestExists => 'You already have a pending connection request.';

  @override
  String get unknownError => 'An unknown error occurred.';

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
