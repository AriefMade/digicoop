import 'package:digicoop/Pekerja%20Keliling/relog/registrasipkl.dart';
import 'package:flutter/material.dart';

class LoginPkl extends StatelessWidget {
  const LoginPkl({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
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
              const SizedBox(height: 16),
              const Text(
                'Hai, Pegawai!!',
                style: TextStyle(
                  color: Color(0xFF7B5233),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login akunmu dengan lengkapi data dirimu!!',
                style: TextStyle(
                  color: Color(0xFFD68F59),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 32),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan username anda',
                  hintStyle: TextStyle(color: Color(0xFFC5AA95), fontSize: 12),
                  filled: true,
                  fillColor: Color(0xFFFFEBDC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const PasswordField(hintText: 'Masukkan password anda'),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A584E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Implementasi tombol Daftar
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => registrasipkl( )));
                  },
                  child: const Text(
                    'Belum memiliki akun? Klik disini',
                    style: TextStyle(color: Color(0xFFD68F59), fontSize: 10),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.help, color: Colors.orange),
                      onPressed: () {
                        // Implementasi tombol Help
                      },
                      padding: EdgeInsets.zero,
                    ),
                    const Text(
                      "Help",
                      style: TextStyle(color: Color(0xFFD68F59)),
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

  const PasswordField({required this.hintText});

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
          hintStyle: const TextStyle(color: Color(0xFFC5AA95), fontSize: 12),
          filled: true,
          fillColor: const Color(0xFFFFEBDC),
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