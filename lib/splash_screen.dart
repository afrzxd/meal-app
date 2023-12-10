import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setelah 5 detik, pindah ke halaman berikutnya
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.white, // Ganti warna sesuai kebutuhan Anda
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/svg/favicon.png',
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Meal App',
              style: GoogleFonts.montserrat(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
