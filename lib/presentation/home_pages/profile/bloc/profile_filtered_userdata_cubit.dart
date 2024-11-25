import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:nutri_fit/domain/entities/user/user.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/home_pages/profile/bloc/profile_filtered_userdata_state.dart';

class UserCubit extends Cubit<UserStateProfile> {
  final GetUserDataUseCase getUserDataUseCase;

  UserCubit(this.getUserDataUseCase) : super(UserInitial());

  // 1. Загрузка данных из Firebase
  Future<void> loadAndSendUserDataToSwagger() async {
    emit(UserLoading());
    print("Загрузка данных из Firebase началась...");

    // Шаг 1: Загрузка данных
    final result = await getUserDataUseCase();
    result.fold(
      (failure) {
        print("Ошибка загрузки данных: $failure");
        emit(UserError('Ошибка загрузки данных: $failure'));
        return;
      },
      (userEntity) async {
        print("Данные успешно загружены: $userEntity");

        // Шаг 2: Фильтрация данных
        final filteredData = _filterUserData(userEntity);
        print("Фильтрованные данные: $filteredData");

        // Шаг 3: Отправка данных в Swagger
        await _sendFilteredUserDataToSwagger(filteredData);
      },
    );
  }

  // Подготовка данных (5 значений)
  Map<String, dynamic> _filterUserData(UserInfoEntity userEntity) {
    print("Фильтрация данных пользователя...");
    return {
      "name": userEntity.name,
      "age": userEntity.age,
      "gender": userEntity.gender,
      "goal": userEntity.goal,
      "height": userEntity.height,
      "weight": userEntity.weight,
    };
  }

  // Отправка данных в Swagger
  Future<void> _sendFilteredUserDataToSwagger(
      Map<String, dynamic> filteredData) async {
    emit(UserSendingData());
    print("Отправка данных в Swagger началась...");

    try {
      final response = await Dio().post(
        'http://46.101.119.129:5000/personalized_plan', // URL Swagger
        data: filteredData,
      );

      print("Ответ от Swagger: ${response.data}");
      if (response.statusCode == 200) {
        emit(UserDataSentSuccessfully(response.data.toString()));
        print("Данные успешно отправлены в Swagger.");
      } else {
        emit(UserError('Ошибка при отправке данных: ${response.statusCode}'));
        print("Ошибка при отправке данных: ${response.statusCode}");
      }
    } catch (e) {
      emit(UserError('Ошибка сети: $e'));
      print("Ошибка сети при отправке данных: $e");
    }
  }
}
