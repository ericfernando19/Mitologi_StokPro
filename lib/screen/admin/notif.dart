import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'Barang Masuk',
      message: 'Barang dengan kode BM001 telah masuk',
      timestamp: '2022-01-01 10:00',
    ),
    NotificationItem(
      title: 'Barang Keluar',
      message: 'Barang dengan kode BK002 telah keluar',
      timestamp: '2022-01-02 11:00',
    ),
    NotificationItem(
      title: 'Stok Barang',
      message: 'Stok barang dengan kode SB003 telah habis',
      timestamp: '2022-01-03 12:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return NotificationItemWidget(
            notification: _notifications[index],
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem notification;

  const NotificationItemWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Text(
              notification.message,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            Text(
              notification.timestamp,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
