import 'package:app_plant_doctor_ai/features/diagnosis/domain/usecases/get_problems.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/presentation/pages/diagnosis_screen.dart';
import 'package:app_plant_doctor_ai/features/home/presentation/pages/home_page.dart';
import 'package:app_plant_doctor_ai/features/my_garden/data/datasources/garden_local_data_source.dart';
import 'package:app_plant_doctor_ai/features/my_garden/data/repositories/garden_repository_impl.dart';
import 'package:app_plant_doctor_ai/features/my_garden/domain/usecases/get_my_plants.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_bloc.dart';
import 'package:app_plant_doctor_ai/features/my_garden/presentation/bloc/garden_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/data/datasources/ProblemLocalDataSource.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/data/repositories/ProblemRepositoryImpl.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/domain/repositories/problem_repository.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/presentation/bloc/problem_bloc.dart';
import 'package:app_plant_doctor_ai/features/diagnosis/presentation/bloc/problem_event.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ProblemBloc(
                GetProblemsUseCase(
                  ProblemRepositoryImpl(ProblemLocalDataSource()),
                ),
              )..add(LoadProblemsEvent()),
        ),
        BlocProvider(
          create:
              (context) => GardenBloc(
                GetGardenPlantsUseCase(
                  GardenRepositoryImpl(GardenLocalDataSource()),
                ),
              )..add(LoadGardenPlantsEvent()), // <- KHỞI ĐỘNG load JSON
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Doctor AI',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const DiagnosePage(),
      routes: {
        '/diagnose': (_) => const DiagnosePage(),
        // các route khác
      },
    );
  }
}
