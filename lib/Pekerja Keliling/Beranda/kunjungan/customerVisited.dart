import 'package:digicoop/Pekerja%20Keliling/Beranda/kunjungan/customerRemaining.dart';
import 'package:flutter/material.dart';

class CustomerVisited extends StatefulWidget {
  const CustomerVisited({super.key});

  @override
  State<CustomerVisited> createState() => _CustomerVisitedState();
}

class _CustomerVisitedState extends State<CustomerVisited> {
  // Improved list for better backend handling
  final List<Map<String, String>> customers = List.generate(
    7,
    (index) => {
      "name": "Jesika",
      "type": index > 4 ? "Pinjaman" : "Simpanan Harian",
      "status": "Berhasil",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Kunjungan',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF6A584E),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {},
                      child: const Text("Customer Visited",style:(TextStyle(fontWeight: FontWeight.bold)),),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.brown[50],
                        foregroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerRemaining()),);},
                      child: const Text("Customer Remaining"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Akun Pegawai",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PGW - 12345677",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '15 Desember 2024',
                    style: TextStyle(
                      color: Color(0xFF6A584E),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0.9, // Corrected height for better text rendering
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Added for spacing between elements
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: const Color(0xFFFFEFE2),
                      child: ListTile(
                        leading: const Icon(Icons.person, color: Colors.brown),
                        title: Text(
                          customer["name"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(customer["type"]!),
                        trailing: Text(
                          customer["status"]!,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.brown[300],
        items: const [
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
