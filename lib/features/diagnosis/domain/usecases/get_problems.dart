import '../entities/problem.dart';
import '../repositories/problem_repository.dart';

class GetProblemsUseCase {
  final ProblemRepository repository;

  GetProblemsUseCase(this.repository);

  Future<List<Problem>> call() async {
    return await repository.getProblems();
  }
}
