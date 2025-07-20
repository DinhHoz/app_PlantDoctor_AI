// TODO Implement this library.
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/plant_model.dart';

class GardenLocalDataSource {
  Future<List<PlantModel>> getLocalGardenPlants() async {
    final jsonString = await rootBundle.loadString(
      'assets/i18n/garden_plants.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PlantModel.fromJson(json)).toList();
  }
}
