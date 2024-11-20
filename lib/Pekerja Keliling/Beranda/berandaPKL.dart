import 'package:flutter/material.dart';
import 'package:digicoop/Pekerja Keliling/nasabah/nasabahPKL.dart';
import 'package:digicoop/Pekerja Keliling/profil/profilPKL.dart';

class BerandaPkl extends StatefulWidget {
  const BerandaPkl ({Key? key}) : super(key: key);
@override
State<BerandaPkl> createState() => _BerandaPklState();}

class _BerandaPklState extends State<BerandaPkl>{
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'), // Sesuaikan gambar
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Angelica Augustine',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Banjar Lukluk, Badung'),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(Icons.notifications, size: 28),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                          child: Text(
                            '5',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Ringkasan Kunjungan
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Rabu, 15 Desember 2024',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('25',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Customer Visited'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('11',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Customer Remaining'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Informasi Total Dana
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Dana',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(
                        'Rp2.000.000,00 /hari ini',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Navigasi Aktivitas
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuCard('Simpanan', Icons.arrow_upward),
                  _buildMenuCard('Penarikan', Icons.arrow_downward),
                  _buildMenuCard('Rekap Harian', Icons.calendar_today),
                  _buildMenuCard('Riwayat Nasabah', Icons.person),
                ],
              ),
              SizedBox(height: 20),

              // Transaksi Terbaru
              Text('Transaksi Terbaru',
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTransactionItem('Simpanan', 'Rp100.000', '10.30'),
              _buildTransactionItem('Simpanan', 'Rp100.000', '10.30'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState((){
              _selectedIndex = index;
              });
          if (index == 1){
            Navigator.push(context,
                MaterialPageRoute(builder : (context) => nasabahPkl())); }
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
  Widget _buildMenuCard(String title, IconData icon) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {}, // Tambahkan navigasi
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.brown),
              SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String type, String amount, String time) {
    return ListTile(
      leading: Icon(Icons.arrow_upward, color: Colors.brown),
      title: Text('$type - $amount'),
      trailing: Text(time),
    );
  }
