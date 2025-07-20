import 'package:app_plant_doctor_ai/features/diagnosis/presentation/pages/diagnosis_screen.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/pages/my_plant_garden_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar trống vì mẫu không có
      appBar: null,
      // Nội dung chính
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Location and notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      "Malang, Indonesia",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/icon_notifi.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Plant',
                prefixIcon: const Icon(Icons.search),
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Premium Banner
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Try Premium Features 🌵",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Claim your offer now and get unlimited recognition, health check and more",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("GET IT"),
                  ),
                ],
              ),
            ),

            // All Features
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Text(
                "All Feature",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 3 / 3.4,
              children: [
                _featureCard(
                  "Diagnose",
                  "Check your plant’s health",
                  "assets/images/rau1-home.jpg",
                ),
                _featureCard(
                  "Identify",
                  "Recognize a plant",
                  "assets/images/rau2-home.jpg",
                ),
                _featureCard(
                  "Water Calculator",
                  "Optimize watering for your plant",
                  "assets/images/rau3-home.jpg",
                ),
                _featureCard(
                  "Reminders",
                  "Stay on top of your plant care",
                  "assets/images/rau-home.jpg",
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Seasonal Tips
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Seasonal Tips",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("See all", style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 25,
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', () {
                // Đang ở Home không cần chuyển
              }),
              _buildNavItem(Icons.health_and_safety_outlined, 'Diagnosi', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DiagnosePage()),
                );
              }),
              const SizedBox(width: 48),
              _buildNavItem(Icons.local_florist_outlined, 'My Plants', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyGardenScreen()),
                );
              }),
              _buildNavItem(Icons.person_outline, 'Profile', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyGardenScreen()),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 15), // Di chuyển xuống 6 pixels
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: const Icon(Icons.camera_alt, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(String title, String desc, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 241, 241),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 123, 122, 122),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
