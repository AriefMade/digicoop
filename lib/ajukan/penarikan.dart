import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:digicoop/ajukan/pilihbank.dart';
import 'package:digicoop/ajukan/pinjaman.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/Profil/profil.dart';

class penarikan extends StatefulWidget {
  @override
  _PenarikanPageState createState() => _PenarikanPageState();
}

class _PenarikanPageState extends State<penarikan> {
  String selectedNominal = "Rp10.000.000";
  String selectedJangkaWaktu = "6 Bulan";
  bool isChecked = false;
  int _selectedIndex = 2;

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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Ajukan()));},
                    child: _buildTabButton("Simpanan", false),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pinjaman())
                      );
                    },
                  child: _buildTabButton("Pinjaman", false)
                  ),
                ),
                Expanded(
                      child: _buildTabButton("Penarikan", true)
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
              "Metode Penarikan",
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
                  child: _buildOptionButton("E-Wallet", selectedJangkaWaktu),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("Bank", selectedJangkaWaktu),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _buildOptionButton("Tunai", selectedJangkaWaktu),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pilih E-Wallet/Bank",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7B5233),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Color(0xFF7B5233),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => pilihbank()));
                            },
                          ),
                        ],
                      ),
                      Divider(thickness: 1, color: Color(0xFF7B5233)),
                    ],
                  ),
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
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFFB35933),
                          ),
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajukan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
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