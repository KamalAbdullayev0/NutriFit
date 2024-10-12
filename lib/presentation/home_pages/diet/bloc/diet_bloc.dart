// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// // Define the Task model
// class Task {
//   final String title;
//   final String subtitle;
//   final int progress;

//   Task({required this.title, required this.subtitle, required this.progress});
// }

// // Define the state for the TaskCubit
// @immutable
// abstract class TaskState {}

// class TaskInitial extends TaskState {}

// class TaskLoading extends TaskState {}

// class TaskLoaded extends TaskState {
//   final List<Task> tasks;

//   TaskLoaded(this.tasks);
// }

// class TaskError extends TaskState {
//   final String message;

//   TaskError(this.message);
// }

// // Create the TaskCubit
// class TaskCubit extends Cubit<TaskState> {
//   TaskCubit() : super(TaskInitial());

//   void loadTasks() {
//     emit(TaskLoading());

//     // Simulate a delay for loading tasks (replace with actual loading logic)
//     Future.delayed(const Duration(seconds: 1), () {
//       // Simulated data
//       final tasks = [
//         Task(title: 'Task 1', subtitle: 'Complete task 1', progress: 20),
//         Task(title: 'Task 2', subtitle: 'Complete task 2', progress: 50),
//       ];
//       emit(TaskLoaded(tasks));
//     });
//   }
// }
