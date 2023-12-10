import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/global.dart';

class DetailPage extends StatelessWidget {
  final String mealDetails;

  DetailPage(this.mealDetails);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mealData = jsonDecode(mealDetails)['meals'][0];
    String tagsString = mealData['strTags'] ?? '-';
    List<String> tags = tagsString.split(',');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          mealData['strMeal'],
          style: GoogleFonts.montserratAlternates(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    child: Image.network(mealData['strMealThumb']),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 1.0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50))),
                      child: Row(
                        children: [
                          const Icon(Icons.location_city),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            mealData['strArea'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '${mealData['strMeal']}',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                mealData['strInstructions'],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Text("Tags :"),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          tag.trim(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
