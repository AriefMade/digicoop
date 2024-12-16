import 'package:digicoop/Dashboard/notifikasipage.dart';
import 'package:digicoop/Riwayat/riwayat.dart';
import 'package:digicoop/ajukan/ajukan.dart';
import 'package:digicoop/Profil/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;
  int _saldoIndex = 2;

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
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/user_image.png'),
                      radius: 28,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Selamat Pagi,',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
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
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotifikasiNb(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 28,
                        color: Colors.grey[700],
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
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
            const SizedBox(height: 10),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! > 0) {
                    _saldoIndex = (_saldoIndex - 1) % 3;
                    if (_saldoIndex < 0) _saldoIndex = 2;
                  } else if (details.primaryVelocity! < 0) {
                    _saldoIndex = (_saldoIndex + 1) % 3;
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF7B5233),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _saldoIndex == 0
                          ? 'Saldo Tabungan'
                          : _saldoIndex == 1
                              ? 'Saldo Deposito'
                              : 'Sisa Pinjaman',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _saldoIndex == 0
                          ? 'Rp 15.000.000,00'
                          : _saldoIndex == 1
                              ? 'Rp 25.000.000,00'
                              : 'Rp 10.000.000,00',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '17965-36512',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                const ClipboardData(text: '17965-36512'));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Nomor akun disalin ke clipboard')),
                            );
                          },
                          child: const Icon(Icons.copy,
                              size: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuButton(Icons.savings, 'Simpanan'),
                _buildMenuButton(Icons.attach_money, 'Pinjaman'),
                _buildMenuButton(Icons.money_off, 'Penarikan'),
                _buildMenuButton(Icons.receipt_long, 'Rekap'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Ringkasan Keuangan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
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
                    children: const [
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Selisih',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${isPositive ? '+' : '-'} $formattedSelisih',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Transaksi Terbaru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        const Icon(Icons.arrow_downward, color: Colors.brown),
                    title: const Text(
                      'Pinjaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Rp 5.000.000,00'),
                    trailing: const Text(
                      '12/07/2024\n10:15',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
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
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Riwayat()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Ajukan()));
          } else if (index == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profil()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Ajukan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFFFEBDC),
          radius: 30,
          child: Icon(icon, color: const Color(0xFF7B5233), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF7B5233),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

String formatCurrency(double amount) {
  return 'Rp ${amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]}.',
      )}';
}