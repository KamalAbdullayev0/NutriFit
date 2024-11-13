// lib/features/product/presentation/cubit/product_state.dart
import 'package:equatable/equatable.dart';

abstract class AddMealState extends Equatable {
  const AddMealState();

  @override
  List<Object?> get props => [];
}

class AddMealLoading extends AddMealState {}

class AddMealSuccess extends AddMealState {}

class AddMealFailure extends AddMealState {}
