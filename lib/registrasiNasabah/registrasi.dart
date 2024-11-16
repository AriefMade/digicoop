import 'package:flutter/material.dart';
import 'test.dart';  // Import text.dart

class registrasi extends StatelessWidget {
  const registrasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lengkapi data dirimu untuk memulai perjalanan baru!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 40),

              // Using text fields imported from text.dart
              EmailField(),
              SizedBox(height: 10),
              UsernameField(),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              CustomerIDField(),
              SizedBox(height: 55),

              // Register Button
              Align(
                alignment: Alignment.center,
              child : SizedBox(
                width: 126,
                height: 48,
              child : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A584E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // nambah fungsinya nanti ngapain button nya ni
                },
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
              ),
              ),
              SizedBox(height: 15),
              // Google Sign-In Button
              Align(
               alignment: Alignment.center,
              child : SizedBox(
                width: 126,
                height: 43,
              child : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFEBDC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Add Google sign-in logic here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login, color: Color(0xFF7B5233)),
                    SizedBox(width: 5),
                    Text(
                      'Google',
                      style: TextStyle(
                        color: Color(0xFF7B5233),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ),
              ),
              SizedBox(height: 10),
              // Login Link
              GestureDetector(
                onTap: () {
                  /* Add navigation to login page here
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => LoginPage(), // Ensure LoginPage is defined in login.dart
                     ),
                   );*/
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sudah memiliki akun? Login ',
                        style: TextStyle(color: Color(0xFFD68F59), fontSize: 10),
                      ),
                      TextSpan(
                        text: 'di sini',
                        style: TextStyle(
                          color: Color(0xFFD68F59),
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              // Help Button
              GestureDetector(
                onTap: () {
                  // Add help logic here
                },
                child: Center(
                child: Column(
                  children: [
                    Icon(Icons.help_outline, color: Color(0xFFD68F59)),
                    SizedBox(height: 4),
                    Text(
                      'Help',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD68F59),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
