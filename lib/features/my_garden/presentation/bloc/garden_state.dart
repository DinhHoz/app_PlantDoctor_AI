import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';

abstract class GardenState {}

class GardenInitial extends GardenState {}

class GardenLoading extends GardenState {}

class GardenLoaded extends GardenState {
  final List<Plant> plants;

  GardenLoaded(this.plants);
}

class GardenError extends GardenState {
  final String message;

  GardenError(this.message);
}
