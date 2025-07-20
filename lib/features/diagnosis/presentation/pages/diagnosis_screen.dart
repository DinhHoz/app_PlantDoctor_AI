import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_widgets/bottom_navigation_bar.dart';
import '../../../diagnosis/presentation/widgets/problem_slide_card.dart';
import '../../../diagnosis/presentation/bloc/problem_bloc.dart';
import '../../../diagnosis/presentation/bloc/problem_event.dart';
import '../../../diagnosis/presentation/bloc/problem_state.dart';
import 'package:app_plant_doctor_ai/features/home/presentation/pages/home_page.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/pages/my_plant_garden_screen.dart';

class DiagnosePage extends StatefulWidget {
  const DiagnosePage({super.key});

  @override
  State<DiagnosePage> createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProblemBloc>().add(LoadProblemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diagnose',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () {
              // TODO: Open diagnosis history
            },
          ),
        ],
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
        selectedIndex: 1,
        onHomeTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        onDiagnosisTap: () {},
        onMyPlantsTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider.value(
                    value: BlocProvider.of<GardenBloc>(context),
                    child: const MyGardenScreen(),
                  ),
            ),
          );
        },
        onProfileTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyGardenScreen()),
          );
        },
        onFabTap: () {
          Navigator.pushNamed(context, '/camera');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diagnose Box
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '🩺 Diagnose',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get Help',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.local_hospital,
                    size: 48,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),

            // Common Problems Section
            const Text(
              'Common Problems',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            BlocBuilder<ProblemBloc, ProblemState>(
              builder: (context, state) {
                if (state is ProblemLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProblemLoaded) {
                  return SizedBox(
                    height: 180,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: state.problems.length,
                      itemBuilder: (context, index) {
                        final problem = state.problems[index];
                        return ProblemSlideCard(
                          title: problem.title,
                          image: problem.image,
                        );
                      },
                    ),
                  );
                } else if (state is ProblemError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Text('No data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
