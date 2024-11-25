import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/home_pages/profile/bloc/profile_filtered_userdata_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/profile/bloc/profile_filtered_userdata_state.dart';

@RoutePage()
class ProfilePageWidget extends StatelessWidget {
  final GetUserDataUseCase getUserDataUseCase;
  const ProfilePageWidget({super.key, required this.getUserDataUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              // Add settings logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileCard(),
            const SizedBox(height: 16),
            _buildPremiumButton(context),
            const SizedBox(height: 16),
            _buildOptionsList(),
            const SizedBox(height: 16),
            _buildThisWeekSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.ozun),
          ),
          const SizedBox(height: 12),
          const Text(
            'Welcome, Kamal!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat('0', 'Record'),
              _buildProfileStat('0', 'Calorie'),
              _buildProfileStat('0', 'Minute'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        showAiInfo(context, getUserDataUseCase);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'AI Personal Trainer',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildOptionItem(
              Icons.fitness_center, 'My Workouts', 'History · Recent'),
          const Divider(height: 1),
          _buildOptionItem(Icons.restaurant, 'My Meal', 'History · Recent'),
          const Divider(height: 1),
          _buildOptionItem(Icons.backup, 'Backup & Restore', ''),
        ],
      ),
    );
  }

  Widget _buildOptionItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 32),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
              style: const TextStyle(fontSize: 15, color: Colors.grey))
          : null,
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 32),
      onTap: () {
        print('Option item tapped!');
      },
    );
  }

  Widget _buildThisWeekSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'This Week',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildWeekStatCard('Duration', '0', 'min'),
            SizedBox(height: 16),
            _buildWeekStatCard('Calories', '0', 'kcal'),
          ],
        ),
      ],
    );
  }

  Widget _buildWeekStatCard(String title, String value, String unit) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' $unit',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void showAiInfo(BuildContext context, GetUserDataUseCase getUserDataUseCase) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: BlocProvider(
            create: (_) =>
                UserCubit(getUserDataUseCase)..loadAndSendUserDataToSwagger(),
            child: BlocBuilder<UserCubit, UserStateProfile>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserDataSentSuccessfully) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: MarkdownBody(
                      data: state.response, // Ваш текст с бэкенда
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.5,
                          fontFamily: 'Serif',
                        ),
                        h1: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        h2: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        h3: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                } else if (state is UserError) {
                  return Center(
                    child: Text(
                      'Ошибка: ${state.errorMessage}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  );
                }

                return const Center(
                  child: Text('Loading...'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
