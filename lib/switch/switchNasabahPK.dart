import 'package:flutter/material.dart';
import '../registrasiNasabah/registrasi.dart';

class RolePage extends StatefulWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  _RolePageState createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  bool isNasabahSelected = false;
  bool isPegawaiSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 393,
        height: 852,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // Top Status Bar
            Positioned(
              left: 31.96,
              top: 21,
              child: Text(
                '9:41',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 15,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            // Welcome Text
            Positioned(
              left: 30,
              top: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Color(0xFF7B5233),
                      fontSize: 40,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pilih Role Anda\nterlebih dahulu.',
                    style: TextStyle(
                      color: Color(0xFFD68F59),
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            // Role Selection
            Positioned(
              left: 30,
              top: 290,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login Sebagai',
                      style: TextStyle(
                        color: Color(0xFF7B5233),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Nasabah Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isNasabahSelected = true;
                            isPegawaiSelected = false;
                          });
                        },
                        child: Container(
                          width: 157,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isNasabahSelected 
                                ? Color(0xFF6A584E) 
                                : Color(0xFFFFEBDC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Nasabah',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Pegawai Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPegawaiSelected = true;
                            isNasabahSelected = false;
                          });
                        },
                        child: Container(
                          width: 157,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isPegawaiSelected 
                                ? Color(0xFF6A584E) 
                                : Color(0xFFFFEBDC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Pegawai',
                              style: TextStyle(
                                color: Color(0xFF7B5233),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Illustration Placeholder
            Positioned(
              left: 70,
              top: 400,
              child: Image.asset(
                'assets/illustration.png', // Replace with your asset path
                width: 250,
                height: 250,
              ),
            ),
            // Continue Button
            Positioned(
              left: 147,
              top: 752,
              child: GestureDetector(
                onTap: () {
                  if (isNasabahSelected) {
                    // Nasabah action here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => registrasi()
                        ),
                    );
                  } else if (isPegawaiSelected) {
                    // Pegawai action here
                    print('Pegawai selected action executed');
                  }
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF6A584E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}