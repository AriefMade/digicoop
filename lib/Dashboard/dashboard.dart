import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:digicoop/Profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;
  int _saldoIndex = 2; // Set to 2 to test "Sisa Pinjaman"

  String formatCurrency(double amount) {
    return 'Rp ${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    double simpanan = 3000000.00;
    double penarikan = 2100000.00;
    double selisih = simpanan - penarikan;
    bool isPositive = selisih >= 0;

    String formattedSelisih = formatCurrency(selisih.abs());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/user_image.png'), // Ganti nanti dengan user input
                      radius: 28,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Pagi,',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          'Angelica Verga Augustine',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Bagian Notifikasi
                Stack(
                  children: [
                    Icon(Icons.notifications,
                        size: 28, color: Colors.grey[700]),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            // Saldo Tabungan
            GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! > 0) {
                    // Swipe Right
                    _saldoIndex = (_saldoIndex - 1) % 3;
                    if (_saldoIndex < 0) _saldoIndex = 2;
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe Left
                    _saldoIndex = (_saldoIndex + 1) % 3;
                  }
                });
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF7B5233),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _saldoIndex == 0 ? 'Saldo Tabungan'
                      : _saldoIndex == 1 ? 'Saldo Deposito'
                      : 'Sisa Pinjaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _saldoIndex == 0 ? 'Rp 15.000.000,00'
                      : _saldoIndex == 1 ? 'Rp 25.000.000,00'
                      : 'Rp 10.000.000,00', // Example value for Sisa Pinjaman
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '17965-36512',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: '17965-36512'));  // Copy the text to clipboard
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Nomor akun disalin ke clipboard'))
                            );
                          },
                          child: Icon(Icons.copy, size: 18, color: Colors.grey),  // Move Icon inside GestureDetector
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Menu Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuButton(Icons.savings, 'Simpanan'),
                _buildMenuButton(Icons.attach_money, 'Pinjaman'),
                _buildMenuButton(Icons.money_off, 'Penarikan'),
                _buildMenuButton(Icons.receipt_long, 'Rekap'),
              ],
            ),
            SizedBox(height: 20),
            // Ringkasan Keuangan
            Text(
              'Ringkasan Keuangan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Simpanan',
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp 3.000.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Penarikan',
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp 2.100.000,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Tambahkan ini
              children: [
                Text(
                  'Selisih',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${isPositive ? '+' : '-'} $formattedSelisih', // Perbaiki format
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            // Transaksi Terbaru
            Text(
              'Transaksi Terbaru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.arrow_downward, color: Colors.brown),
                      title: Text(
                        'Pinjaman',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Rp 5.000.000,00'),
                      trailing: Text(
                        '12/07/2024\n10:15',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // State untuk index yang dipilih
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1){
            Navigator.push(context, MaterialPageRoute (builder: (context) => Riwayat())
          );
          }
          else if (index == 2){
           Navigator.push(context, MaterialPageRoute (builder: (context) => Ajukan())
         );
        }
          else if (index == 3){
            Navigator.push(context, MaterialPageRoute (builder: (context) => Profil())
            );
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

  Widget _buildMenuButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFFFFEBDC),
          radius: 30,
          child: Icon(icon, color: Color(0xFF7B5233), size: 28),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF7B5233),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
