import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/category/get_category.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_state.dart';
import 'package:nutri_fit/service_locator.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());

  Future<void> getCategory() async {
    print("Вызов GetCategoryUseCase...");
    var result = await sl<GetCategoryUseCase>().call();
    result.fold(
      (l) {
        print("Ошибка при получении категории: ${l.runtimeType} - $l");
        emit(CategoryFailure());
      },
      (data) {
        if (data.isNotEmpty) {
          print("Категория содержит данные: $data");
          emit(CategorySuccess(category: data));
        } else {
          print("Получены пустые данные для категории.");
          emit(CategoryFailure());
        }
      },
    );
  }
}
