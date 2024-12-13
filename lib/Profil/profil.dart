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

  final TextEditingController fullNameController = TextEditingController(text: "Angelica Verga Augustine");
  final TextEditingController usernameController = TextEditingController(text: "Angelica Augustine");
  final TextEditingController emailController = TextEditingController(text: "angelicaaugustine321@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "081234567890");
  final TextEditingController workAreaController = TextEditingController(text: "Banjar Lukluk, Mengwi, Badung, Bali");
  final TextEditingController addressController = TextEditingController(text: "Jln. Jempiring, Kuta Selatan, Badung");

  void _showEditConfirmation(String field) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$field has been changed!')),
    );
  }

  Widget _buildEditableDetailItem(String title, TextEditingController controller, {bool editable = true}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          editable 
              ? IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right, color: Colors.brown),
                  onPressed: () {
                    _editField(title, controller);
                  },
                )
              : Container(), // Empty container if not editable
        ],
      ),
    );
  }

  void _editField(String title, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit $title"),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: title,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Trigger state update on save
                });
                _showEditConfirmation(title);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
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
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            const SizedBox(height: 15),
            const Text(
              "Angelica Verga Augustine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF6A584E)),
            ),
            const Text(
              "angelicaaugustine321@gmail.com",
              style: TextStyle(fontSize: 13, color: Color(0xFF6A584E)),
            ),
            const SizedBox(height: 30),

            // Bagian Personal Details
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child:
                Container(
                  width: 333,
                  height: 40,
                  color: const Color(0xFFFFEFE2), // Background color
                  alignment: Alignment.center,
                  child: const Text(
                    "Personal Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A584E),
                    ),
                  ),
                ),
            ),

            Column(
              children: [
                _buildEditableDetailItem("Full Name", fullNameController),
                _buildEditableDetailItem("Username", usernameController),
                _buildEditableDetailItem("Email", emailController, editable: false),
                _buildEditableDetailItem("Phone", phoneController, editable: false),
                _buildEditableDetailItem("Address", addressController),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
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
                            SystemNavigator.pop();
                            // Tambahkan logika log out di sini
                          },
                          child: const Text('Keluar'),
                        ),
                      ],
                    ),
                  );
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
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajukan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}