import 'package:flutter/material.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:digicoop/Dashboard/dashboard.dart';
import 'package:digicoop/Profil/profil.dart';
class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}
class _RiwayatState extends State<Riwayat> {
  int _selectedIndex = 1;
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
              "Riwayat",
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
            SizedBox(height: 16),

            // Filter Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: "17965-36512",
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
                  items: <String>['17965-36512', '17965-36513']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.filter_list, color: Color(0xFF7B5233)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.download, color: Color(0xFF7B5233)),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 1),

            // Transactions List
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 1),
                children: [
                  _buildTransactionDate("12 Juli 2024"),
                  _buildTransactionItem(
                      "Rp 20.000,00", "Tabungan Harian", "Berhasil", Colors.green),
                  _buildTransactionItem(
                      "Rp 4.000,00", "Bunga Tabungan", "Berhasil", Colors.green),
                  _buildTransactionDate("11 Juli 2024"),
                  _buildTransactionItem(
                      "Rp 20.000,00", "Tabungan Harian", "Gagal", Colors.red),
                  _buildTransactionItem(
                      "Rp 4.000,00", "Bunga Tabungan", "Berhasil", Colors.green),
                  _buildTransactionItem("Rp 500.000,00", "Deposito 6 Bulan",
                      "Pending", Colors.orange),
                  _buildTransactionDate("10 Juli 2024"),
                  _buildTransactionItem(
                      "Rp 200.000,00", "Tabungan Harian", "Berhasil", Colors.green),
                  _buildTransactionItem(
                      "Rp 30.000,00", "Bunga Deposito", "Berhasil", Colors.green),
                  _buildTransactionItem(
                      "Rp 100.000,00", "Tabungan Harian", "Berhasil", Colors.green),
                ],
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
              } else if (index == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ajukan()));
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

  Widget _buildTransactionDate(String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        date,
        style: TextStyle(
          color: Color(0xFF7B5233),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
      String amount, String description, String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF6EE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_downward, color: Color(0xFF7B5233)),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7B5233),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7B5233),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            status,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
