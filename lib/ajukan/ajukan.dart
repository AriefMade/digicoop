import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/Profil/profil.dart';
import 'package:flutter/services.dart';

class Ajukan extends StatefulWidget {
  @override
  _AjukanPageState createState() => _AjukanPageState();
}

class _AjukanPageState extends State<Ajukan> {
  String selectedNominal = "Rp10.000.000";
  String selectedJangkaWaktu = "6 Bulan";
  bool isChecked = false;
  int _selectedIndex = 2; // Initialize _selectedIndex

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Ajukan",
              style: TextStyle(
                color: Color(0xFF7B5233),
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 24),

            // Tabs
            Row(
              children: [
                _buildTabButton("Simpanan", true),
                _buildTabButton("Pinjaman", false),
                _buildTabButton("Penarikan", false),
              ],
            ),
            SizedBox(height: 24),

            // Dropdown for Simpanan Type aligned to the right
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
                value: "Simpanan Deposito",
                icon: Icon(Icons.arrow_drop_down),
                style: TextStyle(
                  color: Color(0xFF7B5233),
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (String? newValue) {},
                items: <String>['Simpanan Deposito', 'Simpanan Harian']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24),

            // Nominal Section
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

            // Jangka Waktu Section
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
                SizedBox(width: 5), // Add spacing between buttons
                Expanded(
                  child: _buildOptionButton("6 Bulan", selectedJangkaWaktu),
                ),
                SizedBox(width: 5), // Add spacing between buttons
                Expanded(
                  child: _buildOptionButton("12 Bulan", selectedJangkaWaktu),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Use Expanded or Spacer to push content to the bottom
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Other UI elements not needing position adjustment
                  // ... code ...
                ],
              ),
            ),

            // Checkbox Section moved to be right above the Ajukan Button
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
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

            // Ajukan Button
            ElevatedButton(
              onPressed: isChecked ? () {} : null,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Beranda()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Riwayat()));
              } else if (index == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));
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

  Widget _buildTabButton(String label, bool isActive) {
    return Expanded(
      child: Container(
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
