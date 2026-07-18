/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
home_page.dart

Versiyon:
0.3.0

Görevi:
• Ana ekran
• Heart ID gösterimi
• Kullanıcı karşılama
• Partner durumu
• Partner bağlama
• Gelecekteki Anılarım
• Premium altyapısı

Ayhan & Copilot

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';
import '../../pairing/services/pairing_service.dart';
import '../../../app/router.dart';
import '../controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../pairing/services/pair_request_service.dart';
import '../../../l10n/app_localizations.dart';
import 'couple_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final heartIdController = TextEditingController();

  bool isConnecting = false;
  Map<String, dynamic>? user;
  DocumentSnapshot? incomingRequest;
  bool hasPendingRequest = false;
  int incomingRequestCount = 0;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    user = await controller.loadUser();
    hasPendingRequest = await controller.hasPendingRequest();
    incomingRequestCount = await controller.incomingRequestCount();
    incomingRequest = await controller.getIncomingRequest();

    if (!mounted) return;
    setState(() {});

    final isPaired =
        user != null && (user!["partnerUid"] ?? "").toString().isNotEmpty;

    if (isPaired) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const CoupleHomePage(),
        ),
      );
    }
  }

  Future<void> connectPartner() async {
    if (user == null) return;

    final heartId = heartIdController.text.trim().toUpperCase();

    if (heartId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.enterHeartId)),
      );
      return;
    }

    setState(() => isConnecting = true);

    try {
      await PairingService.sendPairRequest(heartId);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.requestSentWaiting)),
      );

      heartIdController.clear();
      await loadUser();
    } catch (e) {
      if (!mounted) return;

      final t = AppLocalizations.of(context)!;
      String message = e.toString();

      if (message.contains("HeartIdNotFound")) {
        message = t.heartIdNotFound;
      } else if (message.contains("CannotPairWithSelf")) {
        message = t.cannotPairWithSelf;
      } else if (message.contains("PendingRequestExists")) {
        message = t.pendingRequestExists;
      } else {
        message = t.unknownError;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      if (mounted) {
        setState(() => isConnecting = false);
      }
    }
  }

  @override
  void dispose() {
    heartIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final bool isPaired =
        user != null && (user!["partnerUid"] ?? "").toString().isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(t.appTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              const SizedBox(height: 15),
              const Icon(Icons.favorite, color: Colors.red, size: 90),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      t.welcome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user == null ? t.loading : user!["fullName"] ?? "",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Pending Request
              if (hasPendingRequest)
                Card(
                  color: Colors.orange.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Icon(Icons.schedule, color: Colors.white, size: 40),
                        const SizedBox(height: 12),
                        Text(
                          t.requestSent,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.waitingApproval,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),

              // Incoming Request
              if (incomingRequest != null)
                Card(
                  color: Colors.green.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Icon(Icons.favorite, color: Colors.white, size: 42),
                        const SizedBox(height: 12),
                        Text(
                          t.newConnectionRequest,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${t.heartId}: ${incomingRequest!["senderHeartId"]}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final messenger = ScaffoldMessenger.of(context);
                                  await PairRequestService.acceptRequest(incomingRequest!.id);
                                  await PairingService.connectUsers(
                                    myUid: incomingRequest!["receiverUid"],
                                    partnerUid: incomingRequest!["senderUid"],
                                  );
                                  await loadUser();
                                  if (!mounted) return;
                                  messenger.showSnackBar(
                                    SnackBar(content: Text(t.partnerConnected)),
                                  );
                                },
                                icon: const Icon(Icons.check),
                                label: Text(t.accept),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final messenger = ScaffoldMessenger.of(context);
                                  await PairRequestService.rejectRequest(incomingRequest!.id);
                                  await loadUser();
                                  if (!mounted) return;
                                  messenger.showSnackBar(
                                    SnackBar(content: Text(t.requestRejected)),
                                  );
                                },
                                icon: const Icon(Icons.close),
                                label: Text(t.reject),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              // Heart ID Card
              if (!isPaired)
                Card(
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Text(
                          t.heartId,
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        SelectableText(
                          user == null ? t.loading : user!["heartId"] ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(color: Colors.white24),
                        const SizedBox(height: 10),
                        const Icon(Icons.favorite_border, color: Colors.red, size: 45),
                        const SizedBox(height: 15),
                        Text(
                          t.noPartner,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.noPartnerInfo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 30),
              // Connection Area
              if (!hasPendingRequest && !isPaired) ...[
                TextField(
                  controller: heartIdController,
                  style: const TextStyle(color: Colors.white),
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: t.partnerHeartId,
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: isConnecting ? null : () async => await connectPartner(),
                    icon: isConnecting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.favorite),
                    label: Text(isConnecting ? t.connecting : t.connect),
                  ),
                ),
              ] else if (hasPendingRequest) ...[
                Card(
                  color: Colors.orange.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const Icon(Icons.hourglass_top, color: Colors.white, size: 42),
                        const SizedBox(height: 12),
                        Text(
                          t.requestSent,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.waitingApproval,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 28),

              // Quick Actions
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.relationshipTree);
                      },
                      icon: const Icon(Icons.park),
                      label: Text(t.viewTree),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.memories);
                      },
                      icon: const Icon(Icons.auto_awesome),
                      label: Text(t.memories),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.partnerProfile);
                },
                icon: const Icon(Icons.person_pin),
                label: Text(t.customizePartner),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.premiumPreview);
                },
                icon: const Icon(Icons.workspace_premium),
                label: Text(t.premium),
              ),

              const SizedBox(height: 18),

              // Future Memories
              Card(
                color: Colors.grey.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.futureMemoriesTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        t.futureMemoriesInfo,
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
