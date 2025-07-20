import '../entities/problem.dart';

abstract class ProblemRepository {
  Future<List<Problem>> getProblems();
}
