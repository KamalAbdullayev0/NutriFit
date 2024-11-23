import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_state.dart';

class RootAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? imagePath;
  final Color? color;

  const RootAppBar({super.key, this.imagePath, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit()..getUser(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          String userName = 'User'; // Default value if state is not loaded

          if (state is UserSuccess) {
            userName = state.user.name ??
                'User'; // Use user's name from state or default to 'User'
          }

          return AppBar(
            backgroundColor: color ?? Colors.green[300],
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi! $userName',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: imagePath != null
                      ? AssetImage(imagePath!)
                      : const AssetImage(AppImages.ozun),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
