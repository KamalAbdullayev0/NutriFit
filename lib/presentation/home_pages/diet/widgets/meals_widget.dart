import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/core/configs/constants/app_urls.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_state.dart';

class MealsVertical extends StatelessWidget {
  const MealsVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KetoMealCubit, KetoMealState>(
      builder: (context, state) {
        if (state is KetoMealLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is KetoMealSuccess) {
          return _meals(state.ketoMeals);
        }
        if (state is KetoMealFailure) {
          return Center(
            child: Text(
              'Basqa vaxti yoxlayin',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _meals(List<MealEntity> meals) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Stack(
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(1, 1),
                      ),
                    ],
                    border: Border.all(color: Colors.black.withOpacity(0.08)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Container(
                          width: 260,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${AppUrls.mealImageFireStorage}${Uri.encodeComponent(meals[index].name1.trim())}.jpg?${AppUrls.mediaAlt}',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          meals[index].name1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNutrientInfo('Fat', meals[index].fat),
                            _buildNutrientInfo('Protein', meals[index].protein),
                            _buildNutrientInfo('Carbs', meals[index].carbs),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('ad: ${meals[index].name1}');
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNutrientInfo(String label, num value) {
    return Column(
      children: [
        Text(
          '$value g',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
