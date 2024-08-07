import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practiceaap/plans_and_teams.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent (or set a color)
      statusBarIconBrightness: Brightness.dark, // Use dark icons on the status bar
    ));

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top-left corner background image
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.7 - 100, // Center the image horizontally
            child: Image.asset(
              'assets/images/bg3.png',
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          // Bottom-right corner background image
          Positioned(
            bottom: screenHeight * -0.05,
            right: screenWidth * 0.30,
            child: Image.asset(
              'assets/images/bg5.png',
              width: screenWidth * 0.7,
              height: screenWidth * 0.7,
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img.png',
                  width: screenWidth * 0.5,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "One application to \nunify them all",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF393C6B),
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Bring every one together on a same platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333452),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "tailored to handle a diverse range of tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333452),
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to another page
                      Get.to(PlansandTeams());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07, vertical: screenHeight * 0.02),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.040,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
