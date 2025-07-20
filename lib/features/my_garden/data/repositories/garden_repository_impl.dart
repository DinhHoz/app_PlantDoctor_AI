import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';
import '../../domain/repositories/garden_repository.dart';
import '../datasources/garden_local_data_source.dart';

class GardenRepositoryImpl implements GardenRepository {
  final GardenLocalDataSource localDataSource;

  GardenRepositoryImpl(this.localDataSource);

  @override
  Future<List<Plant>> getGardenPlants() async {
    return await localDataSource.getLocalGardenPlants();
  }
}
