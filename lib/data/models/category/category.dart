import 'package:nutri_fit/domain/entities/category/category.dart';

class CategoryModel {
  String? categoryName;
  String? categoryEmoji;

  CategoryModel({
    required this.categoryName,
    required this.categoryEmoji,
  });

  CategoryModel.fromJson(Map<String, dynamic> data) {
    categoryName = data['categoryName'];
    categoryEmoji = data['categoryEmoji'];
  }
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryName: categoryName!,
      categoryEmoji: categoryEmoji!,
    );
  }
}
