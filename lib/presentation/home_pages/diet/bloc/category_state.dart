import 'package:nutri_fit/domain/entities/category/category.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> category;

  CategorySuccess({required this.category});
}

class CategoryFailure extends CategoryState {}
