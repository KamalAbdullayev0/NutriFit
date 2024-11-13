import 'package:get_it/get_it.dart';
import 'package:nutri_fit/data/repository/auth/auth_repository_imp.dart';
import 'package:nutri_fit/data/repository/category/category.dart';
import 'package:nutri_fit/data/repository/keto_meals/keto_meals_repository_impl.dart';
import 'package:nutri_fit/data/repository/user/user.dart';
import 'package:nutri_fit/data/sources/auth/auth_firebase_service.dart';
import 'package:nutri_fit/data/sources/category/category.dart';
import 'package:nutri_fit/data/sources/keto_meals/keto_meals_firebase_service.dart';
import 'package:nutri_fit/data/sources/user/user.dart';
import 'package:nutri_fit/domain/repository/auth/auth.dart';
import 'package:nutri_fit/domain/repository/category/category.dart';
import 'package:nutri_fit/domain/repository/keto_meal/keto_meal.dart';
import 'package:nutri_fit/domain/repository/user/user.dart';
import 'package:nutri_fit/domain/usecases/auth/signin.dart';
import 'package:nutri_fit/domain/usecases/auth/signup.dart';
import 'package:nutri_fit/domain/usecases/category/get_category.dart';
import 'package:nutri_fit/domain/usecases/keto_meal/get_Keto_Meals.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  // User

  sl.registerSingleton<UserDataRepositoryFirebaseService>(UserDataRepositoryFirebaseServiceImpl());

  sl.registerSingleton<UserDataRepository>(UserDataRepositoryImpl());

  sl.registerSingleton<GetUserDataUseCase>(GetUserDataUseCase());


  // Keto Meal

  sl.registerSingleton<GetKetoMealsUseCase>(GetKetoMealsUseCase());

  sl.registerSingleton<KetoMealRepository>(KetoMealsRepositoryImpl());

  sl.registerSingleton<KetoMealsFirebaseService>(
      KetoMealsFirebaseServiceImpl());

  // Category

  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  sl.registerSingleton<GetCategoryUseCase>(GetCategoryUseCase());

  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
}
