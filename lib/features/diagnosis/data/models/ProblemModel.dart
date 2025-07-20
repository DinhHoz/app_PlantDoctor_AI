import 'package:app_plant_doctor_ai/features/diagnosis/domain/entities/Problem.dart';

class ProblemModel extends Problem {
  ProblemModel({required String title, required String image})
    : super(title: title, image: image);

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image};
  }
}
