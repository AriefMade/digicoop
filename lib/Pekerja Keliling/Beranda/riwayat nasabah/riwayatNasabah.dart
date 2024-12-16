import 'package:flutter/material.dart';

class RiwayatNasabah extends StatefulWidget {
  const RiwayatNasabah({super.key});

  @override
  State<RiwayatNasabah> createState() => _RiwayatNasabahState();
}

class _RiwayatNasabahState extends State<RiwayatNasabah> {
  String? _selectedPeriode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Riwayat Nasabah",
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input ID Nasabah
            TextField(
              decoration: InputDecoration(
                hintText: "Input ID Nasabah",
                fillColor: Color(0xFFF3E8E1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Judul Pilih Periode Pencarian
            Text(
              "Pilih Periode Pencarian:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Radio Buttons untuk memilih periode
            Column(
              children: [
                RadioListTile<String>(
                  value: "Hari ini",
                  groupValue: _selectedPeriode,
                  onChanged: (value) {
                    setState(() {
                      _selectedPeriode = value;
                    });
                  },
                  title: Text("Hari ini"),
                  activeColor: Colors.brown,
                ),
                RadioListTile<String>(
                  value: "1 Minggu",
                  groupValue: _selectedPeriode,
                  onChanged: (value) {
                    setState(() {
                      _selectedPeriode = value;
                    });
                  },
                  title: Text("1 Minggu"),
                  activeColor: Colors.brown,
                ),
                RadioListTile<String>(
                  value: "1 Bulan",
                  groupValue: _selectedPeriode,
                  onChanged: (value) {
                    setState(() {
                      _selectedPeriode = value;
                    });
                  },
                  title: Text("1 Bulan"),
                  activeColor: Colors.brown,
                ),
                RadioListTile<String>(
                  value: "Pilih Tanggal",
                  groupValue: _selectedPeriode,
                  onChanged: (value) {
                    setState(() {
                      _selectedPeriode = value;
                    });
                    if (value == "Pilih Tanggal") {
                      // Logika untuk membuka date picker
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        if (date != null) {
                          print("Tanggal dipilih: $date"); // Handle tanggal di sini
                        }
                      });
                    }
                  },
                  title: Text("Pilih Tanggal"),
                  activeColor: Colors.brown,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Pilih tab "Nasabah"
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.brown[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Nasabah",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}