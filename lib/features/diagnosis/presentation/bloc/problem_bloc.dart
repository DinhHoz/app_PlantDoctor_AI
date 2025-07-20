import 'package:app_plant_doctor_ai/features/diagnosis/domain/entities/Problem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/domain/usecases/get_problems.dart';
import 'problem_event.dart';
import 'problem_state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final GetProblemsUseCase getProblemsUseCase;

  ProblemBloc(this.getProblemsUseCase) : super(ProblemInitial()) {
    on<LoadProblemsEvent>((event, emit) async {
      emit(ProblemLoading());
      try {
        final problems = await getProblemsUseCase();
        emit(ProblemLoaded(problems.cast<Problem>()));
      } catch (e) {
        emit(ProblemError('Failed to load problems: ${e.toString()}'));
      }
    });
  }
}
