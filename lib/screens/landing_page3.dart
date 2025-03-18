import 'package:flutter/material.dart';
import 'landing_page4.dart'; // Import the LandingPage3 file
import 'signin_screen.dart'; // Import the SigninScreen file

class LandingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top section with skip button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to SigninScreen when Skip is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signinScreen()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Center image section
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Main illustration image
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/img_2.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 40),

                  // Text content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                     'Empowering Travel Agents\nwith Smart Tech & Collaboration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First dot - red
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFE05D4E),
                    shape: BoxShape.circle,
                  ),
                ),
                // Second dot - active, red
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFE05D4E),
                    shape: BoxShape.circle,
                  ),
                ),
                // Third dot - inactive, grey
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFE05D4E),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to LandingPage3
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage4()),
                  );
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE05D4E),
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Login text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account? '),
                GestureDetector(
                  onTap: () {
                    // Navigate to SigninScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signinScreen()),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Color(0xFFE05D4E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
