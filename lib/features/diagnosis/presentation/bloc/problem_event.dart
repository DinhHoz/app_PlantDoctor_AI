import 'package:equatable/equatable.dart';

abstract class ProblemEvent extends Equatable {
  const ProblemEvent();

  @override
  List<Object> get props => [];
}

class LoadProblemsEvent extends ProblemEvent {}
