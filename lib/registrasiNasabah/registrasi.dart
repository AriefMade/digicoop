import 'package:digicoop/constants/authentication.dart';
import 'package:flutter/material.dart';
import 'package:digicoop/registrasiNasabah/loginnb.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl = 'https://localhost:8000/api'; // Replace with your backend URL

  Future<void> registerUser(String email, String username, String password, String idNasabah) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': username,
        'email': email,
        'password': password,
        'idNasabah': idNasabah,
      }),
    );

    if (response.statusCode == 201) {
      // Success
      print('User Registered Successfully');
    } else {
      // Handle error
      print('Failed to register user: ${response.body}');
    }
  }

  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully logged in
      var data = json.decode(response.body);
      String token = data['token'];
      print('User Logged in Successfully, Token: $token');
    } else {
      // Handle error
      print('Login failed: ${response.body}');
    }
  }
}

class registrasi extends StatelessWidget {
  registrasi({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idNasabahController = TextEditingController();
  final AuthService authService = AuthService();
  final AuthenticationController _authenticationController = Get.put(AuthenticationController())

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
                controller: _emailController,
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
                controller: _usernameController,
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
              PasswordField(controller: _passwordController, hintText: 'Masukkan password anda'),
              SizedBox(height: 16),
              PasswordField(controller: _idNasabahController, hintText: 'Masukkan ID nasabah anda'),
              SizedBox(height: 32),
              Obx(() {
                return _authenticationController.isLoading.value
                    ?const CircularProgressIndicator()
                  : Center(
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
                      onPressed: () async {
                        try {
                          await authService.registerUser(
                            _emailController.text.trim(),
                            _usernameController.text.trim(),
                            _passwordController.text.trim(),
                            _idNasabahController.text.trim(),
                          );
                        } catch (e) {
                          print(e.toString());
                        }
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
              }
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginnb()));
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
  final TextEditingController controller;
  final String hintText;

  const PasswordField({super.key, required this.controller, required this.hintText});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.controller,
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