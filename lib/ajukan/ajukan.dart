import 'dart:ui';

import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:digicoop/ajukan/penarikan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/Profil/profil.dart';
import 'package:digicoop/ajukan/pinjaman.dart';

class Ajukan extends StatefulWidget {
  const Ajukan({super.key});

  @override
  _AjukanPageState createState() => _AjukanPageState();
}

class _AjukanPageState extends State<Ajukan> {
  String selectedNominal = "Rp10.000.000";
  String selectedJangkaWaktu = "6 Bulan";
  bool isChecked = false;
  int _selectedIndex = 2;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            backgroundColor: const Color(0xFFEBD9CB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              "Syarat dan Ketentuan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B5233),
              ),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(thickness: 1.0, color: Color(0xFFC4C4C4)),
                  const SizedBox(height: 0.5),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        "Anggota yang ingin membuka rekening simpanan di DigiCoop wajib terdaftar sebagai anggota koperasi dan telah memiliki akun pada aplikasi DigiCoop. Simpanan dapat berupa Simpanan Harian atau Simpanan Deposito, dengan nominal minimal Rp1.000.000. Jangka waktu untuk Simpanan Deposito tersedia dalam pilihan 3 bulan, 6 bulan, dan 12 bulan, sedangkan Simpanan Harian dapat dicairkan kapan saja sesuai kebijakan yang berlaku.\n\n"
                        "Anggota wajib memberikan data yang valid dan benar saat melakukan pendaftaran simpanan. Bunga simpanan akan dihitung berdasarkan kebijakan suku bunga yang berlaku dan akan diberikan secara berkala sesuai dengan ketentuan yang telah disepakati. Anggota juga diwajibkan menjaga saldo minimum sesuai dengan jenis simpanan yang dipilih.\n\n"
                        "Pencairan Simpanan Deposito sebelum jatuh tempo akan dikenakan penalti sesuai dengan ketentuan yang berlaku. Data pribadi anggota akan diproses sesuai dengan kebijakan privasi DigiCoop. Dengan membuka rekening simpanan, anggota dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan ini. Ketentuan ini dapat berubah sewaktu-waktu tanpa pemberitahuan sebelumnya.",
                        style: TextStyle(fontSize: 14, color: Color(0xFF6A584E)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0.5),
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: const Color(0xFF7B5233),
                  minimumSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implement logic for submission here
                },
                child: const Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ajukan",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildTabButton("Simpanan", true),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pinjaman()),
                      );
                    },
                    child: _buildTabButton("Pinjaman", false),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => penarikan()),
                      );
                    },
                    child: _buildTabButton("Penarikan", false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
                value: "Simpanan Deposito",
                icon: const Icon(Icons.arrow_drop_down),
                style: const TextStyle(
                  color: Color(0xFF7B5233),
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    // Add logic to handle dropdown value change
                  });
                },
                items: <String>['Simpanan Deposito', 'Simpanan Harian']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Nominal",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 7),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildOptionButton("Rp1.000.000", selectedNominal),
                    const SizedBox(width: 5),
                    _buildOptionButton("Rp2.000.000", selectedNominal),
                    const SizedBox(width: 5),
                    _buildOptionButton("Rp5.000.000", selectedNominal),
                  ],
                ),
                const SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildOptionButton("Rp10.000.000", selectedNominal),
                      const SizedBox(width: 5),
                      _buildOptionButton("Rp20.000.000", selectedNominal),
                      const SizedBox(width: 5),
                      _buildOptionButton("Rp50.000.000", selectedNominal),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              selectedNominal,
              style: const TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Minimum nominal Rp1.000.000",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Jangka Waktu",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _buildOptionButton("3 Bulan", selectedJangkaWaktu),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("6 Bulan", selectedJangkaWaktu),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("12 Bulan", selectedJangkaWaktu),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Additional UI elements
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF7B5233),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: "Saya menyetujui ",
                      style: const TextStyle(
                        color: Color(0xB0B35933),
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "syarat dan ketentuan ",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFFB35933),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _showConfirmationDialog(); // Display modal
                            },
                        ),
                        const TextSpan(
                          text: "yang berlaku",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: isChecked
                  ? () {
                      // Define button action
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B5233),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Ajukan",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
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
              switch (index) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Riwayat()));
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profil()));
                  break;
              }
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/home.png')), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/riwayat.png')), label: 'Riwayat'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/ajukan.png')), label: 'Ajukan'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/profile.png')), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6A584E) : const Color(0xFFFFEBDC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF7B5233),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildOptionButton(String label, String selectedValue) {
    bool isSelected = label == selectedValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (label.contains("Rp")) {
            selectedNominal = label;
          } else {
            selectedJangkaWaktu = label;
          }
        });
      },
      child: Container(
        width: 113,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7B5233) : const Color(0xFFFFEBDC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF7B5233),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}