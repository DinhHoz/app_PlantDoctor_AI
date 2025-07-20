import '../../domain/entities/problem.dart';
import '../../domain/repositories/problem_repository.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/data/datasources/ProblemLocalDataSource.dart';

class ProblemRepositoryImpl implements ProblemRepository {
  final ProblemLocalDataSource localDataSource;

  ProblemRepositoryImpl(this.localDataSource);

  @override
  Future<List<Problem>> getProblems() async {
    final problems = await localDataSource.getProblems();
    return problems.cast<Problem>(); // ProblemModel extends Problem
  }
}
