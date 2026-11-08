import 'package:flutter/material.dart';

import '../models/planet.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = '/details';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Planet planet = ModalRoute.of(context)!.settings.arguments as Planet;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 144,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/planet_header.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Color(0x99000000),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 68,
                    right: 68,
                    child: Text(
                      planet.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 19,
                    left: 13,
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFFEE403D),
                          foregroundColor: Colors.white,
                        ),
                        tooltip: 'Back to planets',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: const EdgeInsets.all(2.5),
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    right: 16,
                    bottom: 7,
                    child: Text(
                      planet.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 9, 16, 0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(planet.imagePath, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 36, 16, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    planet.about,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildFact('Distance from Sun (km)', planet.distanceFromSun),
                  buildFact('Length of Day (hours)', planet.dayLength),
                  buildFact(
                    'Orbital Period (Earth years)',
                    planet.orbitalPeriod,
                  ),
                  buildFact('Radius (km)', planet.radius),
                  buildFact('Mass (kg)', planet.mass),
                  buildFact('Gravity (m/s²)', planet.gravity),
                  buildFact('Surface Area (km²)', planet.surfaceArea),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFact(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        '$label : $value',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
