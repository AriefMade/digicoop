import 'package:digicoop/Pekerja%20Keliling/relog/loginpkl.dart';
import 'package:flutter/material.dart';


class registrasipkl extends StatelessWidget {
  const registrasipkl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  color: Color(0xFF7B5233),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Lengkapi data dirimu untuk memulai perjalanan baru!',
                style: TextStyle(
                  color: Color(0xFFD68F59),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan email anda',
                  hintStyle: TextStyle(color: Color(0xFFC5AA95), fontSize: 12),
                  filled: true,
                  fillColor: Color(0xFFFFEBDC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan username anda',
                  hintStyle: TextStyle(color: Color(0xFFC5AA95), fontSize: 12),
                  filled: true,
                  fillColor: Color(0xFFFFEBDC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              PasswordField(hintText: 'Masukkan password anda'),
              SizedBox(height: 16),
              PasswordField(hintText: 'Masukkan ID pegawai anda'),
              SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6A584E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Implementasi tombol Daftar
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text(
                        'Daftar',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPkl()));
                  },
                  child: Text(
                    'Sudah memiliki akun? Login di sini',
                    style: TextStyle(color: Color(0xFFD68F59), fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFD68F59),
                      size: 28,
                    ),
                    Text(
                      "help",
                      style: TextStyle(
                        color: Color(0xFFD68F59),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hintText;

  const PasswordField({super.key, required this.hintText});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xFFC5AA95), fontSize: 12),
          filled: true,
          fillColor: Color(0xFFFFEBDC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}