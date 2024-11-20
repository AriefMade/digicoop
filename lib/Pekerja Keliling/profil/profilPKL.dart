import 'package:flutter/material.dart';

class profilPkl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Warna latar belakang krem
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // Foto profil
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'), // Path gambar profil
              ),
              const SizedBox(height: 16),
              // Nama dan Email
              const Text(
                'Angelica Verga Augustine', // Nama
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'angelicaaugustine321@gmail.com', // Email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              // Card untuk Personal Details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEDFD2), // Warna krem muda
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Detail informasi
                    buildDetailItem('Full Name', 'Angelica Verga Augustine'),
                    buildDetailItem('Username', 'Angelica Augustine'),
                    buildDetailItem('Email', 'angelicaaugustine321@gmail.com'),
                    buildDetailItem('Phone', '081234567890'),
                    buildDetailItem('Work Area',
                        'Banjar Luluk, Mengwi, Badung, Bali'),
                    buildDetailItem(
                        'Address', 'Jln. Jempiring, Kuta Selatan, Badung'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Tombol Log Out
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Warna tombol
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Aksi logout
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Log Out'),
                      content:
                      const Text('Apakah Anda yakin ingin keluar akun?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Tambahkan logika log out di sini
                          },
                          child: const Text('Keluar'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan item detail
  Widget buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
          ),
          // Ikon edit
          Icon(
            Icons.edit,
            size: 18,
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
