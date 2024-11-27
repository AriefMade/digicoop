import 'package:flutter/material.dart';
import 'package:digicoop/Pekerja Keliling/nasabah/nasabahPKL.dart';
import 'package:digicoop/Pekerja Keliling/profil/profilPKL.dart';

class BerandaPkl extends StatefulWidget {
  const BerandaPkl({Key? key}) : super(key: key);

  @override
  State<BerandaPkl> createState() => _BerandaPklState();
}

class _BerandaPklState extends State<BerandaPkl> {
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
              SizedBox(height: 30),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'), // Sesuaikan gambar
                        radius: 27,
                      ),
                      SizedBox(width: 20),
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xB2CFB4A4)
                    ),
                    padding: EdgeInsets.all(6),
                    child: Stack(
                      children: [
                        Icon(Icons.notifications, size: 28),
                        Positioned(
                          right: 0,
                          // Adjusted position for notification icon
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
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Ringkasan Kunjungan
              Card(
                color: Color(0xFF69574D),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row( // Start a Row to add an icon next to the text
                        mainAxisAlignment: MainAxisAlignment.start, // Align children to the start (left)
                        children: [
                          Icon(
                            Icons.calendar_today, // Add the calendar icon
                            color: Colors.white,
                          ),
                          SizedBox(width: 8), // Add some space between the icon and the text
                          Text(
                            'Rabu, 15 Desember 2024',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      //25 customer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '25',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF69574D),
                                  ),
                                ),
                                Text(
                                  'Customer Visited',
                                  style: TextStyle(
                                    color: Color(0xFF67554B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //11 customer remaining
                          Container (
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child : Column(
                              children: [
                                Text(
                                  '11',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF69574D),
                                  ),
                                ),
                                Text('Customer Remaining',
                                  style : TextStyle(
                                    color: Color(0xFF69574D),
                                  )
                                ),
                              ],
                            ),
                          ),
                          //beda bagian
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Total Dana and Navigasi Aktivitas combined
              Card(
                color: Color(0xFF69574D),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Total Dana
                      Text(
                        'Total Dana',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Rp2.000.000,00 /hari ini',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aktivitas',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // Navigasi Aktivitas
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 0, // Remove spacing between columns
                            mainAxisSpacing: 0, // Remove spacing between rows
                            childAspectRatio: 2.7, // Keep the child aspect ratio to make cards wider
                            children: [
                              _buildMenuCard('Simpanan', Icons.arrow_upward),
                              _buildMenuCard('Penarikan', Icons.arrow_downward),
                              _buildMenuCard('Rekap Harian', Icons.calendar_today),
                              _buildMenuCard('Riwayat Nasabah', Icons.person),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Transaksi Terbaru
              Text(
                'Transaksi Terbaru',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NasabahPkl()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => profilPkl()),
            );
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

  Widget _buildMenuCard(String title, IconData icon) {
    return Card(
      color: Colors.white, // Set color for each menu card
      elevation: 3,
      child: InkWell(
        onTap: () {}, // Add navigation if needed
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.brown),
              SizedBox(width: 10), // Fixed width compared to height
              Text(title,
                  style : TextStyle(
                    color: Color(0xFF543E2D),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.15,
                    letterSpacing: -0.32,),
              ),
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
}
