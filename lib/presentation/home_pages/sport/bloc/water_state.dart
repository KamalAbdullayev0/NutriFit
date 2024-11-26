abstract class WaterCounterState {}

class WaterCounterInitial extends WaterCounterState {}

class WaterCounterLoaded extends WaterCounterState {
  final int count;

  WaterCounterLoaded({required this.count});
}
