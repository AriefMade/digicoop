import 'package:flutter/material.dart';

class Penarikan extends StatefulWidget {
  const Penarikan({super.key});

  @override
  State<Penarikan> createState() => _PenarikanState();
}
class _PenarikanState extends State<Penarikan>{
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
          "Penarikan",
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
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari ID Nasabah",
                prefixIcon: Icon(Icons.search, color: Colors.brown),
                fillColor: Color(0xFFF3E8E1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Daftar Penarikan:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // List of Penarikan
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Jumlah kartu (sesuaikan dengan data Anda)
                itemBuilder: (context, index) {
                  return PenarikanCard(
                    status: index == 0
                        ? "Terima"
                        : index == 1 || index == 3
                        ? "Tunda"
                        : "Tolak",
                    color: index == 0
                        ? Colors.green
                        : index == 2
                        ? Colors.red
                        : Colors.blue, //TODO : gak keliatan kalau makek biru
                  );
                },
              ),
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

class PenarikanCard extends StatelessWidget {
  final String status;
  final Color color;

  const PenarikanCard({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF3E8E1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nasabah #12345678",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Jumlah: Rp. 1.000.000",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                status,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Text("Detail"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}