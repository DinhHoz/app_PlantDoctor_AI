import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_bloc.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_state.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/widgets/plant_card.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/widgets/add_plant_bottom_sheet.dart';

class MyPlantsTab extends StatelessWidget {
  const MyPlantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Nút Add Plant
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => const AddPlantBottomSheet(),
              );
            },
            icon: const Icon(Icons.add, size: 28),
            label: const Text(
              'Add Plant',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Gợi ý tìm cây phù hợp
        GestureDetector(
          onTap: () {
            // TODO: Navigate to suggestion screen
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Navigate to Suggestions")),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: const [
                Icon(Icons.auto_awesome, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Find Plants Perfect for You',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Danh sách cây trong vườn
        Expanded(
          child: BlocBuilder<GardenBloc, GardenState>(
            builder: (context, state) {
              if (state is GardenLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GardenLoaded) {
                if (state.plants.isEmpty) {
                  return const Center(child: Text("You have no plants yet."));
                }

                return ListView.separated(
                  itemCount: state.plants.length,
                  itemBuilder: (context, index) {
                    final plant = state.plants[index];
                    return PlantCard(plant: plant);
                  },
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 8),
                );
              } else if (state is GardenError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(child: Text("No data found."));
              }
            },
          ),
        ),
      ],
    );
  }
}
