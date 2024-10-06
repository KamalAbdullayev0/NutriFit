// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nutri_fit/core/configs/assets/app_images.dart';
// import 'package:nutri_fit/presentation/diet/pages/diet.dart';
// import 'package:nutri_fit/presentation/home/bloc/bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedTab = 0;

//   final List<Widget> _pages = [
//     const Center(child: Text('Index 1: Home')),
//     const DietWidgetPage(),
//     const Center(child: Text('Index 2: Favorite')),
//   ];

//   void onSelectedTab(int index) {
//     setState(() {
//       _selectedTab = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TaskCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green[300],
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'HI! Insanin adi',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               CircleAvatar(
//                 backgroundImage: AssetImage(AppImages.ozun),
//               ),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.green[300],
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               // Используем BlocBuilder для построения UI на основе состояния TaskCubit
//               child: BlocBuilder<TaskCubit, List<Task>>(
//                 builder: (context, taskList) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: taskList
//                         .map((task) =>
//                             taskCard(task.title, task.subtitle, task.progress))
//                         .toList(),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Today's plan",
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 children: [
//                   planItem(
//                     icon: Icons.local_laundry_service,
//                     title: 'Wash yesterday\'s clothes',
//                     subtitle: 'The whole life should wash',
//                     time: 'Just now',
//                   ),
//                   planItem(
//                     icon: Icons.book,
//                     title: 'Read a design journal',
//                     subtitle: 'Be the best designer',
//                     time: '3 h later',
//                   ),
//                   planItem(
//                     icon: Icons.account_balance,
//                     title: 'Go to the bank',
//                     subtitle: 'Take out the design fee',
//                     time: '3 h later',
//                   ),
//                   planItem(
//                     icon: Icons.sports_basketball,
//                     title: 'Post a work on Dribbble',
//                     subtitle: 'Hope to be recognized',
//                     time: '7 h later',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedTab,
//           onTap: onSelectedTab,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_today),
//               label: 'Tasks',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.event),
//               label: 'Schedule',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.visibility_off),
//               label: 'Hide',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               label: 'Profile',
//             ),
//           ],
//           selectedItemColor: Colors.green[300],
//           unselectedItemColor: Colors.grey,
//         ),
//       ),
//     );
//   }

//   Widget taskCard(String title, String subtitle, int progress) {
//     return Expanded(
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     color: Colors.orange,
//                   ),
//                   const SizedBox(width: 10),
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 subtitle,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14),
//               ),
//               const SizedBox(height: 16),
//               LinearProgressIndicator(
//                 value: progress / 100,
//                 color: Colors.green,
//                 backgroundColor: Colors.green[100],
//               ),
//               const SizedBox(height: 8),
//               Text('$progress%', style: const TextStyle(color: Colors.green)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget planItem({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required String time,
//   }) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.grey[200],
//         child: Icon(icon, color: Colors.green),
//       ),
//       title: Text(title),
//       subtitle: Text(subtitle),
//       trailing: Text(
//         time,
//         style: const TextStyle(color: Colors.grey),
//       ),
//     );
//   }
// }
