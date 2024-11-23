// import 'package:flutter/material.dart';

// Widget _buildProfileCard() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 20),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           blurRadius: 8,
//           offset: const Offset(0, 4),
//         ),
//       ],
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const CircleAvatar(
//           radius: 50,
//           backgroundImage: AssetImage(AppImages.ozun),
//         ),
//         const SizedBox(height: 12),
//         const Text(
//           'Welcome, Kamal!',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildProfileStat('0', 'Record'),
//             _buildProfileStat('0', 'Calorie'),
//             _buildProfileStat('0', 'Minute'),
//           ],
//         ),
//       ],
//     ),
//   );
// }
