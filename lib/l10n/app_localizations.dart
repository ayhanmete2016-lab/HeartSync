import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'HeartSync'**
  String get appName;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'HeartSync ❤️'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome ❤️'**
  String get welcome;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'❤️ Connect'**
  String get connect;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @partnerHeartId.
  ///
  /// In en, this message translates to:
  /// **'Partner Heart ID'**
  String get partnerHeartId;

  /// No description provided for @heartId.
  ///
  /// In en, this message translates to:
  /// **'Heart ID'**
  String get heartId;

  /// No description provided for @noPartner.
  ///
  /// In en, this message translates to:
  /// **'No partner connected yet.'**
  String get noPartner;

  /// No description provided for @waitingApproval.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner approval.'**
  String get waitingApproval;

  /// No description provided for @requestSent.
  ///
  /// In en, this message translates to:
  /// **'Connection request sent.'**
  String get requestSent;

  /// No description provided for @requestSentWaiting.
  ///
  /// In en, this message translates to:
  /// **'❤️ Connection request sent. Waiting for approval.'**
  String get requestSentWaiting;

  /// No description provided for @newConnectionRequest.
  ///
  /// In en, this message translates to:
  /// **'❤️ New Connection Request'**
  String get newConnectionRequest;

  /// No description provided for @partnerConnected.
  ///
  /// In en, this message translates to:
  /// **'❤️ Partner successfully connected.'**
  String get partnerConnected;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @requestRejected.
  ///
  /// In en, this message translates to:
  /// **'Connection request rejected.'**
  String get requestRejected;

  /// No description provided for @viewTree.
  ///
  /// In en, this message translates to:
  /// **'View Tree'**
  String get viewTree;

  /// No description provided for @memories.
  ///
  /// In en, this message translates to:
  /// **'Memories'**
  String get memories;

  /// No description provided for @customizePartner.
  ///
  /// In en, this message translates to:
  /// **'Customize Partner'**
  String get customizePartner;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium Experience'**
  String get premium;

  /// No description provided for @enterHeartId.
  ///
  /// In en, this message translates to:
  /// **'Please enter a Heart ID.'**
  String get enterHeartId;

  /// No description provided for @addMemory.
  ///
  /// In en, this message translates to:
  /// **'New Memory'**
  String get addMemory;

  /// No description provided for @addMemoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Create a new memory.'**
  String get addMemoryDescription;

  /// No description provided for @memoryDetail.
  ///
  /// In en, this message translates to:
  /// **'Memory Details'**
  String get memoryDetail;

  /// No description provided for @memoryDetailDescription.
  ///
  /// In en, this message translates to:
  /// **'Details of this memory.'**
  String get memoryDetailDescription;

  /// No description provided for @editMemory.
  ///
  /// In en, this message translates to:
  /// **'Edit Memory'**
  String get editMemory;

  /// No description provided for @editMemoryDescription.
  ///
  /// In en, this message translates to:
  /// **'You can edit this memory.'**
  String get editMemoryDescription;

  /// No description provided for @noMemories.
  ///
  /// In en, this message translates to:
  /// **'No memories yet.'**
  String get noMemories;

  /// No description provided for @createMemory.
  ///
  /// In en, this message translates to:
  /// **'Create Memory'**
  String get createMemory;

  /// No description provided for @noPartnerInfo.
  ///
  /// In en, this message translates to:
  /// **'Even without a partner, you can collect memories, keep a diary, and make this space meaningful for yourself.'**
  String get noPartnerInfo;

  /// No description provided for @futureMemoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'🌱 Future Memories'**
  String get futureMemoriesTitle;

  /// No description provided for @futureMemoriesInfo.
  ///
  /// In en, this message translates to:
  /// **'Even if you don\'t have a partner yet, you can start collecting your memories, thoughts, poems, and feelings from today.\n\nOne day, if someone enters your life, you can choose to share them.'**
  String get futureMemoriesInfo;

  /// No description provided for @heartIdNotFound.
  ///
  /// In en, this message translates to:
  /// **'Heart ID not found.'**
  String get heartIdNotFound;

  /// No description provided for @cannotPairWithSelf.
  ///
  /// In en, this message translates to:
  /// **'You cannot pair with yourself.'**
  String get cannotPairWithSelf;

  /// No description provided for @pendingRequestExists.
  ///
  /// In en, this message translates to:
  /// **'You already have a pending connection request.'**
  String get pendingRequestExists;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get unknownError;

  /// No description provided for @sendNotification.
  ///
  /// In en, this message translates to:
  /// **'Send Notification'**
  String get sendNotification;

  /// No description provided for @leaveFeeling.
  ///
  /// In en, this message translates to:
  /// **'Leave a feeling for your partner.'**
  String get leaveFeeling;

  /// No description provided for @sendSilently.
  ///
  /// In en, this message translates to:
  /// **'Send Silently'**
  String get sendSilently;

  /// No description provided for @messageType.
  ///
  /// In en, this message translates to:
  /// **'Message Type'**
  String get messageType;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationTitle;

  /// No description provided for @silentNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Silent Message'**
  String get silentNotificationTitle;

  /// No description provided for @notificationSent.
  ///
  /// In en, this message translates to:
  /// **'Message sent.'**
  String get notificationSent;

  /// No description provided for @silentMessageDefault.
  ///
  /// In en, this message translates to:
  /// **'A silent message has been left.'**
  String get silentMessageDefault;

  /// No description provided for @visibleMessageDefault.
  ///
  /// In en, this message translates to:
  /// **'A message has been left.'**
  String get visibleMessageDefault;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
