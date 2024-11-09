import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/models/category/category.dart';
import 'package:nutri_fit/domain/entities/category/category.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategory();
}

class CategoryFirebaseServiceImpl implements CategoryFirebaseService {
  @override
  Future<Either> getCategory() async {
    try {
      List<CategoryEntity> categorys = [];
      var data = await FirebaseFirestore.instance
          .collection('category')
          .orderBy('index')
          .get();

      for (var element in data.docs) {
        var categoryModel = CategoryModel.fromJson(element.data());
        categorys.add(categoryModel.toEntity());
      }
      return Right(categorys);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
