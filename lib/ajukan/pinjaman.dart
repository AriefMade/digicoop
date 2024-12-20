import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:digicoop/ajukan/penarikan.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/Profil/profil.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
class pinjaman extends StatefulWidget {
  const pinjaman({super.key});

  @override
  _PinjamanPageState createState() => _PinjamanPageState();
}

class _PinjamanPageState extends State<pinjaman> {
  String selectedNominal = "Rp10.000.000";
  String selectedJangkaWaktu = "6 Bulan";
  bool isChecked = false;
  int _selectedIndex = 2;

  //TODO : pop up
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), //TODO : import library dart ui
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
                        "Pemohon wajib merupakan anggota terdaftar dan telah memiliki akun pada aplikasi DigiCoop. Pemohon juga harus berusia minimal 21 tahun atau telah menikah, serta memiliki pekerjaan tetap atau penghasilan tetap yang dapat diverifikasi. Jumlah pinjaman minimal adalah Rp1.000.000 dan maksimal sesuai limit yang telah disetujui oleh pihak DigiCoop. Jangka waktu pinjaman tersedia mulai dari 3 bulan, 6 bulan, hingga 12 bulan dengan suku bunga tetap sebesar 0,3% per bulan (dapat disesuaikan dengan ketentuan aplikasi). Setiap pinjaman akan dikenakan biaya administrasi sebesar 1% dari total pinjaman.\n\n"
                            "Pemohon wajib membayar cicilan tepat waktu sesuai jadwal yang telah ditentukan. Keterlambatan pembayaran akan dikenakan denda sebesar 1% per hari dari jumlah cicilan yang terlambat. Pemohon juga wajib memberikan data yang valid dan benar, serta memahami bahwa apabila ditemukan adanya data palsu, pihak DigiCoop berhak membatalkan pinjaman atau mengambil tindakan hukum.\n\n"
                            "DigiCoop berhak menolak pengajuan pinjaman apabila dokumen atau data yang diberikan tidak memenuhi syarat, serta dapat menghubungi pemohon melalui nomor telepon, email, atau metode komunikasi lain yang terdaftar. Data pribadi pemohon akan diproses sesuai dengan kebijakan privasi yang berlaku. Dengan mengajukan pinjaman, pemohon dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan ini. Ketentuan ini dapat berubah sewaktu-waktu tanpa pemberitahuan terlebih dahulu.",
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
            Text(
              "Ajukan",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child : GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => Ajukan()));},
                  child: _buildTabButton("Simpanan", false),
                  ),
                ),
                Expanded(
                  child: _buildTabButton("Pinjaman", true),),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>penarikan())
                      );
                      },
                      child: _buildTabButton("Penarikan", false)
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Nominal",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 7),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildOptionButton("Rp1.000.000", selectedNominal),
                    SizedBox(width: 5),
                    _buildOptionButton("Rp2.000.000", selectedNominal),
                    SizedBox(width: 5),
                    _buildOptionButton("Rp5.000.000", selectedNominal),
                  ],
                ),
                SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildOptionButton("Rp10.000.000", selectedNominal),
                      SizedBox(width: 5),
                      _buildOptionButton("Rp20.000.000", selectedNominal),
                      SizedBox(width: 5),
                      _buildOptionButton("Rp50.000.000", selectedNominal),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              selectedNominal,
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Minimum nominal Rp1.000.000",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Jangka Waktu",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _buildOptionButton("3 Bulan", selectedJangkaWaktu),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("6 Bulan", selectedJangkaWaktu),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("12 Bulan", selectedJangkaWaktu),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  activeColor: Color(0xFF7B5233),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: "Saya menyetujui ",
                      style: TextStyle(
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
                          recognizer: TapGestureRecognizer() //TODO : import library gesture
                            ..onTap = () {
                              _showConfirmationDialog(); // Display modal
                            },
                        ),
                        TextSpan(
                          text: "yang berlaku",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: isChecked ? () {
                // Define button action
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7B5233),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
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
              if (index == 0) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Beranda()));
              } else if (index == 1) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Riwayat()));
              } else if (index == 3) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Profil()));
              }
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/home.png')), label: 'Beranda'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/riwayat.png')), label: 'Riwayat'),
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
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF6A584E) : Color(0xFFFFEBDC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? Colors.white : Color(0xFF7B5233),
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
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF7B5233) : Color(0xFFFFEBDC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF7B5233),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}