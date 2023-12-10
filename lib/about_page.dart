import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "About Me",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  "https://avatars.githubusercontent.com/u/91076458?v=4",
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Muhamad Afriza",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "(pelajar / mahasiswa)",
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("github.com/afrzxd")
            ],
          ),
        ),
      ),
    );
  }
}
