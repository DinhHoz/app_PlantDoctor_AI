import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_plant_doctor_ai/features/my_garden/domain/usecases/get_my_plants.dart';
import 'garden_event.dart';
import 'garden_state.dart';

class GardenBloc extends Bloc<GardenEvent, GardenState> {
  final GetGardenPlantsUseCase getGardenPlantsUseCase;

  GardenBloc(this.getGardenPlantsUseCase) : super(GardenInitial()) {
    on<LoadGardenPlantsEvent>((event, emit) async {
      emit(GardenLoading());
      try {
        final plants = await getGardenPlantsUseCase();
        emit(GardenLoaded(plants));
      } catch (e) {
        emit(GardenError(e.toString()));
      }
    });
  }
}
