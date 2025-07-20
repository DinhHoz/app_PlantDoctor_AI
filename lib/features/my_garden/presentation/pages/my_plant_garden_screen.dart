import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_plant_doctor_ai/features/home/presentation/pages/home_page.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_bloc.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/widgets/plant_card.dart';
import 'package:app_plant_doctor_ai/shared_widgets/bottom_navigation_bar.dart';
import '../widgets/my_plants_tab.dart';
import '../widgets/reminders_tab.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/presentation/pages/diagnosis_screen.dart';

class MyGardenScreen extends StatefulWidget {
  const MyGardenScreen({Key? key}) : super(key: key);

  @override
  State<MyGardenScreen> createState() => _MyGardenScreenState();
}

class _MyGardenScreenState extends State<MyGardenScreen> {
  int selectedTabIndex = 0;

  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 0:
        return const MyPlantsTab();
      case 1:
      default:
        return const RemindersTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Garden',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),

        actions: [
          IconButton(icon: const Icon(Icons.access_time), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                isSelected: [selectedTabIndex == 0, selectedTabIndex == 1],
                selectedColor: Colors.white,
                color: Colors.grey.shade600,
                fillColor: Colors.green,
                constraints: const BoxConstraints(minHeight: 40, minWidth: 140),
                onPressed: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
                children: const [Text('My Plants'), Text('Reminders')],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 15),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pushNamed(context, '/camera');
          },
          child: const Icon(Icons.camera_alt, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2,
        onHomeTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        onDiagnosisTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider.value(
                    value: BlocProvider.of<GardenBloc>(context),
                    child: const DiagnosePage(),
                  ),
            ),
          );
        },
        onMyPlantsTap: () {
          // Đang ở MyPlants
        },
        onProfileTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => const PlaceholderPage(title: 'Ask Expert Page'),
            ),
          );
        },
        onFabTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlaceholderPage(title: 'Camera Page'),
            ),
          );
        },
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title')),
    );
  }
}
