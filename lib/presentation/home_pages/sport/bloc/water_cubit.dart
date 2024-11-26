import 'package:bloc/bloc.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/water_state.dart';

class WaterCounterCubit extends Cubit<WaterCounterState> {
  WaterCounterCubit() : super(WaterCounterInitial());

  // Логика увеличения стакана воды
  void incrementWater() {
    if (state is WaterCounterLoaded) {
      final currentCount = (state as WaterCounterLoaded).count;
      if (currentCount < 8) {
        emit(WaterCounterLoaded(count: currentCount + 1));
      }
    } else {
      emit(WaterCounterLoaded(count: 1)); // Если нет состояния, начнем с 1
    }
  }
}
