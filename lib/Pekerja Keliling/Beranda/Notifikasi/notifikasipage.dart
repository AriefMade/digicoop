import 'package:flutter/material.dart';

class NotifikasiPKL extends StatefulWidget {
  const NotifikasiPKL({super.key});

  @override
  State<NotifikasiPKL> createState() => _NotifikasiPKLState();
}

class _NotifikasiPKLState extends State<NotifikasiPKL> {
  final List<Map<String, String>> notifications = List.generate(
    5,
    (index) => {
      "title": "Penarikan berhasil!",
      "description": "Sekarang kamu dapat berbelanja sesuka hatimu :D",
      "date": "29 Juli 2024",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_box_rounded, color : Colors.brown),
            onPressed: () {
              // Add logic for additional features
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.attach_money, color: Colors.brown),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        notification["description"]!,
                        style: TextStyle(color: Colors.brown[300]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        notification["date"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.brown[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}