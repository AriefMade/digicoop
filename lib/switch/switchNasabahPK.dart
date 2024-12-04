import 'package:digicoop/Pekerja%20Keliling/Beranda/berandaPKL.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/Dashboard/dashboard.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                color: isNasabahSelected
                                    ? Color(0xFFFFEBDC)
                                    : Color(0xFF6A584E),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
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
                                color: isPegawaiSelected 
                                    ? Colors.white 
                                    : Color(0xFF7B5233),
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
              left: 110,
              top: 752,
              child: GestureDetector(
                onTap: () {
                  if (isNasabahSelected) {
                    // Nasabah action here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()
                        ),
                    );
                  } else if (isPegawaiSelected) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BerandaPkl()));
                  }
                },
                child: Container(
                  width: 180,
                  height: 50,
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