import 'package:flutter/material.dart';
import 'package:digicoop/Pekerja Keliling/Beranda/berandaPKL.dart';
import 'package:digicoop/Pekerja Keliling/nasabah/nasabahPKL.dart';
import 'package:digicoop/Pekerja Keliling/profil/profilPKL.dart';

class CustomerVisited extends StatefulWidget{
  const CustomerVisited ({Key? key}) : super (key: key);

@override
    State<CustomerVisited> createState() => _CustomerVisitedState();}

class _CustomerVisitedState extends State<CustomerVisited>{
@override
  Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              
              //Header
              SizedBox(
                width: 250,
                    height: 27,
                    child: Text(
                        "Daftar Kunjungan",
                      style: TextStyle(
                        color: Color(0xFF6A584E),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
              ),

            ],
          ),
      ),
      ),
  );
}
}
