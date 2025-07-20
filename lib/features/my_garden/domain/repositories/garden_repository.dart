import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';

abstract class GardenRepository {
  Future<List<Plant>> getGardenPlants();
}
