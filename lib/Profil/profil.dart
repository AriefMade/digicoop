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

  // Create TextEditingControllers for each field
  final TextEditingController fullNameController = TextEditingController(text: "Angelica Verga Augustine");
  final TextEditingController usernameController = TextEditingController(text: "Angelica Augustine");
  final TextEditingController emailController = TextEditingController(text: "angelicaaugustine321@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "081234567890");
  final TextEditingController addressController = TextEditingController(text: "Jln. Jempiring, Kuta Selatan, Badung");

  // Function to show snackbar
  void _showEditConfirmation(String field) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$field has been changed!')),
    );
  }

  // Widget to display editable fields
  Widget _buildEditableDetailItem(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onFieldSubmitted: (value) {
              _showEditConfirmation(title);
            },
          ),
        ],
      ),
    );
  }

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

            // Editable Personal Details
            _buildEditableDetailItem("Full Name", fullNameController),
            _buildEditableDetailItem("Username", usernameController),
            _buildEditableDetailItem("Email", emailController),
            _buildEditableDetailItem("Phone", phoneController),
            _buildEditableDetailItem("Address", addressController),

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
}