import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';
import '../repositories/garden_repository.dart';

class GetGardenPlantsUseCase {
  final GardenRepository repository;

  GetGardenPlantsUseCase(this.repository);

  Future<List<Plant>> call() {
    return repository.getGardenPlants();
  }
}
