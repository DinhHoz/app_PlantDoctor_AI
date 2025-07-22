import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';

class PlantModel extends Plant {
  PlantModel({
    required int id,
    required String name,
    required String type,
    required String imageUrl,
  }) : super(id: id, name: name, type: type, imageUrl: imageUrl);

  // Convert từ JSON sang PlantModel
  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert từ PlantModel sang JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'type': type, 'imageUrl': imageUrl};
  }

  // Optional: hỗ trợ clone object với copyWith
  PlantModel copyWith({int? id, String? name, String? type, String? imageUrl}) {
    return PlantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
