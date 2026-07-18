import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../services/notification_service.dart';
import '../services/notification_templates.dart';

class SendNotificationPage extends StatefulWidget {
  const SendNotificationPage({super.key});

  @override
  State<SendNotificationPage> createState() =>
      _SendNotificationPageState();
}

class _SendNotificationPageState
    extends State<SendNotificationPage> {
  String selectedType = 'thinking';
  bool silent = true;

  Future<void> send() async {
    final l10n = AppLocalizations.of(context)!;

    final message = silent
        ? NotificationTemplates.silentMessages[selectedType] ??
            l10n.silentMessageDefault
        : NotificationTemplates.visibleMessages[selectedType] ??
            l10n.visibleMessageDefault;

    await NotificationService.sendSilentNotification(
      receiverUid: 'demo-partner',
      title: silent
          ? l10n.silentNotificationTitle
          : l10n.notificationTitle,
      message: message,
      type: silent ? 'silent' : 'visible',
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.notificationSent),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(l10n.sendNotification),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.leaveFeeling,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            SwitchListTile.adaptive(
              title: Text(
                l10n.sendSilently,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              value: silent,
              onChanged: (value) =>
                  setState(() => silent = value),
              activeThumbColor: Colors.redAccent,
              activeTrackColor:
                  Colors.redAccent.withValues(alpha: 0.5),
              tileColor: const Color(0xFF1E1E1E),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: selectedType,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: l10n.messageType,
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              items: [
                for (final entry in (silent
                        ? NotificationTemplates.silentMessages
                        : NotificationTemplates.visibleMessages)
                    .entries)
                  DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  ),
              ],
              onChanged: (value) => setState(
                () => selectedType =
                    value ?? 'thinking',
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: send,
              icon: const Icon(Icons.send),
              label: Text(l10n.send),
            ),
          ],
        ),
      ),
    );
  }
}