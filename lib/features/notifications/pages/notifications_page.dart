import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../services/notification_service.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Bildirimler'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.sendNotification);
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.favorite_border),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: NotificationService.getNotificationsForCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data?.docs ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Henüz bir bildirim yok.',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = items[index].data();
              return Card(
                color: const Color(0xFF1E1E1E),
                child: ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.redAccent),
                  title: Text(
                    item['title'] ?? 'Bildirim',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    item['message'] ?? '',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
