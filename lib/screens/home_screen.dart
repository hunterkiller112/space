import 'package:flutter/material.dart';

import '../data/planets.dart';
import '../models/planet.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  PageController pageController = PageController(initialPage: 3);

  void showPreviousPlanet() {
    int previousIndex = selectedIndex - 1;
    if (previousIndex < 0) {
      previousIndex = planets.length - 1;
    }
    pageController.animateToPage(
      previousIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void showNextPlanet() {
    int nextIndex = selectedIndex + 1;
    if (nextIndex == planets.length) {
      nextIndex = 0;
    }
    pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Planet selectedPlanet = planets[selectedIndex];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 237,
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
                      'Explore',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    right: 16,
                    bottom: 0,
                    child: Text(
                      'Which planet\nwould you like to explore?',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 28),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: planets.length,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    Planet planet = planets[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(planet.imagePath, fit: BoxFit.contain),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFFEE403D),
                        foregroundColor: Colors.white,
                      ),
                      tooltip: 'Previous planet',
                      onPressed: showPreviousPlanet,
                      padding: const EdgeInsets.all(2.5),
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      selectedPlanet.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFFEE403D),
                        foregroundColor: Colors.white,
                      ),
                      tooltip: 'Next planet',
                      onPressed: showNextPlanet,
                      padding: const EdgeInsets.all(2.5),
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: selectedPlanet,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEE403D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Explore ${selectedPlanet.name}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
