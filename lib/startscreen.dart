import 'package:flutter/material.dart';
import 'ExploreScreen.dart';

void main() {
  runApp(TravelApp());
}
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive UI
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'asset/Vector.png', // Use your background asset
              fit: BoxFit.cover,
            ),
          ),

          // Foreground Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                // Title: LET'S
                const Text(
                  "LET'S",
                  style: TextStyle(
                    color: Color(0xFF425884),
                    fontWeight: FontWeight.w300,
                    fontSize: 25.0,
                    height: 1.5,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),

                // Title: EXPLORE
                const Text(
                  "EXPLORE",
                  style: TextStyle(
                    color: Color(0xFF425884),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 48.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),

                // Title: THE WORLD
                const Text(
                  "THE WORLD",
                  style: TextStyle(
                    color: Color(0xFF425884),
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),

                // Subtitle
                const Text(
                  "Hi! Welcome to the app for travel enthusiasts. A one-stop app to plan your journeys. Explore now!",
                  style: TextStyle(
                    color: Color(0xFF425884),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),

                // Enter Button
                SizedBox(
                  width: size.width * 0.5,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      // Navigate or perform action
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExploreScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF5495FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      "ENTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // Travel Image (Responsive)
                Image.asset(
                  'asset/stimg.png', // Use your image asset here
                  height: size.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


