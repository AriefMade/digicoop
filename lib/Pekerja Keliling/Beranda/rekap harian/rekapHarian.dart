import 'package:flutter/material.dart';

class RekapHarian extends StatefulWidget {
  const RekapHarian({super.key});

  @override
  State<RekapHarian> createState() => _RekapHarianState();
}
class _RekapHarianState extends State<RekapHarian>{
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
          "Rekap Harian",
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
            // Dropdown untuk Pilih Transaksi
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Pilih Transaksi",
                fillColor: Color(0xFFF3E8E1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [
                DropdownMenuItem(value: "all", child: Text("Semua Transaksi")),
                DropdownMenuItem(value: "income", child: Text("Pemasukan")),
                DropdownMenuItem(value: "expense", child: Text("Pengeluaran")),
              ],
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            // Date Picker
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: "dd/mm/yy",
                suffixIcon: Icon(Icons.calendar_today, color: Colors.brown),
                fillColor: Color(0xFFF3E8E1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () {
                // Logika untuk membuka date picker
              },
            ),
            SizedBox(height: 16),
            Text(
              "Daftar Transaksi:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Daftar Transaksi
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Jumlah transaksi
                itemBuilder: (context, index) {
                  return TransaksiCard(
                    amount: index == 1 ? -50000 : 20000,
                    time: "09.11 WITA",
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Pilih tab "Beranda"
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

class TransaksiCard extends StatelessWidget {
  final int amount; // Positif untuk pemasukan, negatif untuk pengeluaran
  final String time;

  const TransaksiCard({super.key, required this.amount, required this.time});

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
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
          Text(
            "${amount > 0 ? '+' : ''} Rp ${amount.abs()}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: amount > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
