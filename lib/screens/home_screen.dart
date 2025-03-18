import 'package:flutter/material.dart';
import 'package:qwerty/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 40,
                    color: Color(0xFFE3493B), // Red logo color
                  ),
                  TextButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Logout succesfull");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signinScreen(),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.logout, color: Colors.grey),
                    label: Text("Logout", style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Registration Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFE3493B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complete Your Registration",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "For sharing your Complete experience.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Ongoing Activities
              Text(
                "Ongoing Activities",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                // This will be empty as shown in the image
              ),
              SizedBox(height: 20),
              // Dashboard
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                  children: [
                    _buildDashboardItem(
                      "Itinerary\nCreation",
                      Colors.blue,
                      Icons.map,
                    ),
                    _buildDashboardItem(
                      "Commission",
                      Colors.green,
                      Icons.attach_money,
                    ),
                    _buildDashboardItem(
                      "Resources",
                      Colors.brown,
                      Icons.business,
                    ),
                    _buildDashboardItem("Packages", Colors.amber, Icons.layers),
                    _buildDashboardItem(
                      "Events",
                      Colors.pink,
                      Icons.calendar_today,
                      badge: "2",
                    ),
                    _buildDashboardItem(
                      "Orders",
                      Colors.lightGreen,
                      Icons.list_alt,
                    ),
                    _buildDashboardItem(
                      "My Clients",
                      Colors.teal,
                      Icons.people,
                    ),
                    _buildDashboardItem(
                      "Collaborate",
                      Colors.orange,
                      Icons.handshake,
                    ),
                    _buildDashboardItem(
                      "Analytics",
                      Colors.purple,
                      Icons.insert_chart,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    String title,
    Color color,
    IconData icon, {
    String? badge,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 30),
                SizedBox(height: 6),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (badge != null)
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension ColorExtension on Colors {
  static Color get salmon => Color(0xFFF8A193);
}
