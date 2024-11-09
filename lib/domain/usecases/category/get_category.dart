import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/repository/category/category.dart';
import 'package:nutri_fit/service_locator.dart';

class GetCategoryUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CategoryRepository>().getCategory();
  }
}
