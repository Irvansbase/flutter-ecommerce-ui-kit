// ignore: file_names
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, String>> notifications = [
    {
      'title': 'Order Confirmed',
      'body': 'Your order #1234 has been confirmed.',
    },
    {
      'title': 'New Promotion!',
      'body': 'Get 20% off for all iced coffee this week!',
    },
    {
      'title': 'Delivery Update',
      'body': 'Your order is out for delivery.',
    },
    {
      'title': 'Membership',
      'body': 'You have earned 100 points.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No notifications 💤",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];

                return Dismissible(
                  key: Key(notif['title']! + index.toString()),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${notif['title']} dismissed'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 24),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 24),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    tileColor: Colors.white,
                    shape: Border(
                      bottom: BorderSide(
                          color: Colors.grey, width: 1),
                    ),
                    title: Text(
                      notif['title']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      notif['body']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    leading: const Icon(Icons.notifications_none),
                  ),
                );
              },
            ),
    );
  }
}
