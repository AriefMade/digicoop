import 'package:flutter/material.dart';

class Simpanan extends StatefulWidget {
  const Simpanan({super.key});

  @override
  State<Simpanan> createState() => _SimpananState();
}
class _SimpananState extends State<Simpanan>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simpanan',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID Nasabah",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan ID Nasabah",
                      filled: true,
                      fillColor: Colors.brown[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Nominal Simpanan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: "Rp. ",
                      hintText: "0",
                      filled: true,
                      fillColor: Colors.brown[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Tanggal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "dd/mm/yy",
                            filled: true,
                            fillColor: Colors.brown[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.calendar_today, color: Colors.brown),
                        onPressed: () {
                          // Tambahkan logika untuk memilih tanggal
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan transaksi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16.0),
              ),
              child: Text(
                "Simpan Transaksi",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

