import 'package:digicoop/Pekerja%20Keliling/Beranda/berandaPKL.dart';
import 'package:digicoop/Pekerja%20Keliling/profil/profilPKL.dart';
import 'package:flutter/material.dart';

class NasabahPkl extends StatefulWidget {
  const NasabahPkl ({super.key});
  @override
  State<NasabahPkl> createState() => NasabahPklState();}

class NasabahPklState extends State<NasabahPkl>{
  int _selectedIndex = 0;
  // Data dummy untuk daftar nasabah
  final List<Map<String, dynamic>> nasabahList = [
    {'name': 'Anna Gallagher', 'address': 'Jln. Ratna No. 10, Banjar Luluk', 'status': true},
    {'name': 'Anna Gallagher', 'address': 'Jln. Ratna No. 10, Banjar Luluk', 'status': false},
    {'name': 'Anna Gallagher', 'address': 'Jln. Ratna No. 10, Banjar Luluk', 'status': true},
    {'name': 'Anna Gallagher', 'address': 'Jln. Ratna No. 10, Banjar Luluk', 'status': false},
    {'name': 'Anna Gallagher', 'address': 'Jln. Ratna No. 10, Banjar Luluk', 'status': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Background warna cream
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Nasabah',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Pencarian nasabah
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Nasabah',
                filled: true,
                fillColor: const Color(0xFFFDEFEA), // Warna cream muda
                prefixIcon: const Icon(Icons.search, color: Colors.brown),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Daftar nasabah
            Expanded(
              child: ListView.separated(
                itemCount: nasabahList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final nasabah = nasabahList[index];
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDEFEA),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Status icon
                            Icon(
                              nasabah['status'] ? Icons.check_circle : Icons.cancel,
                              color: nasabah['status'] ? Colors.green : Colors.red,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            // Nama dan alamat nasabah
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nasabah['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                                Text(
                                  nasabah['address'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Tombol View Details
                        ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman detail
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailNasabahPage(nasabah: nasabah),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF2E6), // Warna cream button
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal:   9.0, vertical: 8.0),
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState((){
            _selectedIndex = index;
          });
          if (index == 0){
            Navigator.push(context,
                MaterialPageRoute(builder : (context) => BerandaPkl())); }
          else if (index == 2){
            Navigator.push(context,
                MaterialPageRoute(builder : (context) => profilPkl()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Nasabah'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// Halaman Detail Nasabah
class DetailNasabahPage extends StatelessWidget {
  final Map<String, dynamic> nasabah;

  const DetailNasabahPage({required this.nasabah, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${nasabah['name']}'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${nasabah['name']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Alamat: ${nasabah['address']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${nasabah['status'] ? 'Selesai' : 'Belum'}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
