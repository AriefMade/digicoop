import 'package:flutter/material.dart';
import 'package:digicoop/Pekerja Keliling/Beranda/berandaPKL.dart';
import 'package:digicoop/Pekerja Keliling/nasabah/nasabahPKL.dart';
import 'package:digicoop/Pekerja Keliling/profil/profilPKL.dart';

class CustomerRemaining extends StatefulWidget{
  const CustomerRemaining ({Key? key}) : super (key: key);

  @override
  State<CustomerRemaining> createState() => _CustomerVisitedState();}

class _CustomerVisitedState extends State<CustomerRemaining>{
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

            ],
          ),
        ),
      ),
    );
  }
}