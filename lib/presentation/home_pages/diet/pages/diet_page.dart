import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/diet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DietPageWidget extends StatelessWidget {
  const DietPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskCubit()..loadTasks(), // Initialize the cubit and load tasks
      child: Scaffold(
        appBar: const RootAppBar(imagePath: AppImages.ozun),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state is TaskLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: state.tasks
                          .map((task) => taskCard(
                              task.title, task.subtitle, task.progress))
                          .toList(),
                    );
                  } else {
                    return const Text('Error loading tasks');
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's plan",
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  planItem(
                    icon: Icons.local_laundry_service,
                    title: 'Wash yesterday\'s clothes',
                    subtitle: 'The whole life should wash',
                    time: 'Just now',
                  ),
                  planItem(
                    icon: Icons.book,
                    title: 'Read a design journal',
                    subtitle: 'Be the best designer',
                    time: '3 h later',
                  ),
                  planItem(
                    icon: Icons.account_balance,
                    title: 'Go to the bank',
                    subtitle: 'Take out the design fee',
                    time: '3 h later',
                  ),
                  planItem(
                    icon: Icons.sports_basketball,
                    title: 'Post a work on Dribbble',
                    subtitle: 'Hope to be recognized',
                    time: '7 h later',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taskCard(String title, String subtitle, int progress) {
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: progress / 100,
                color: Colors.green,
                backgroundColor: Colors.green[100],
              ),
              const SizedBox(height: 8),
              Text('$progress%', style: const TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget planItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
