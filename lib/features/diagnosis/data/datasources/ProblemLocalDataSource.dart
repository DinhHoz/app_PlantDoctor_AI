import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/data/models/ProblemModel.dart';

class ProblemLocalDataSource {
  Future<List<ProblemModel>> getProblems() async {
    final jsonString = await rootBundle.loadString('assets/i18n/problems.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => ProblemModel.fromJson(json)).toList();
  }
}
