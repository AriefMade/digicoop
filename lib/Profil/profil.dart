import 'package:flutter/material.dart';
import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:flutter/services.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar dan Nama
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'), // Sesuaikan path gambar
            ),
            const SizedBox(height: 15),
            const Text(
              "Angelica Verga Augustine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const Text(
              "angelicaaugustine321@gmail.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Personal Details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Personal Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ),
            const SizedBox(height: 10),

            // Detail Items
            _buildDetailItem("Full Name", "Angelica Verga Augustine"),
            _buildDetailItem("Username", "Angelica Augustine"),
            _buildDetailItem("Email", "angelicaaugustine321@gmail.com"),
            _buildDetailItem("Phone", "081234567890"),
            _buildDetailItem("Address", "Jln. Jempiring, Kuta Selatan, Badung"),

            const SizedBox(height: 30),

            // Tombol Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Aksi logout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
            Future.microtask(() {
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Beranda()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Riwayat()));
              } else if (index == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ajukan()));
              }
              // Handle other pages as needed
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajukan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // Widget untuk item detail
  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
