import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:app_plant_doctor_ai/features/my_garden/data/models/plant_model.dart';

class PlantStorage {
  static const _fileName = 'garden_plants.json';

  // Lấy đường dẫn file lưu trữ JSON
  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  // Lưu danh sách cây vào file
  static Future<void> savePlants(List<PlantModel> plants) async {
    final file = await _getFile();
    final jsonData = plants.map((e) => e.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonData));
  }

  // Tải danh sách cây từ file
  static Future<List<PlantModel>> loadPlants() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return [];
      final jsonString = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => PlantModel.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  // Thêm cây mới
  static Future<void> addPlant(PlantModel newPlant) async {
    final current = await loadPlants();
    current.add(newPlant);
    await savePlants(current);
  }
}
