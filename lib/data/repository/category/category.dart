import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/category/category.dart';
import 'package:nutri_fit/domain/repository/category/category.dart';
import 'package:nutri_fit/service_locator.dart';


class CategoryRepositoryImpl extends CategoryRepository {

  @override
  Future<Either> getCategory() async {
    return await sl<CategoryFirebaseService>().getCategory();
  }
}
