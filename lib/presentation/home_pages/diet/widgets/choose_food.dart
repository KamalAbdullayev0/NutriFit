import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/entities/category/category.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_state.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_cubit.dart';

class ChooseFood extends StatelessWidget {
  const ChooseFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategorySuccess) {
          return _chooseFood(state.category);
        }
        if (state is CategoryFailure) {
          return Center(
            child: Text(
              'Пожалуйста, попробуйте позже',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _chooseFood(List<CategoryEntity> category) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: Colors.black.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        category[index].categoryEmoji,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        category[index].categoryName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
                        context.read<KetoMealCubit>().fetchMealsForCategory(
                            category[index].categoryName);
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
}
