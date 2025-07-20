// features/garden/presentation/widgets/plant_card.dart
import 'package:flutter/material.dart';
import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          plant.imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
        ),
        title: Text(plant.name),
        subtitle: Text(plant.type),
        trailing: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.alarm_add),
          label: const Text('Add Reminder'),
        ),
      ),
    );
  }
}
