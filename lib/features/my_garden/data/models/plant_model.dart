import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';

class PlantModel extends Plant {
  PlantModel({
    required int id,
    required String name,
    required String type,
    required String imageUrl,
  }) : super(id: id, name: name, type: type, imageUrl: imageUrl);

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
    );
  }
}
