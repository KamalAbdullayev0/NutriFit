// import 'package:flutter/material.dart';

// class MovieListWithSearch extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.only(top: 70),
//           itemCount: 5,
//           itemExtent: 163,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                       border: Border.all(color: Colors.black.withOpacity(0.2)),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     clipBehavior: Clip.hardEdge,
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 20),
//                               Text(
//                                 'title',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'subtitle',
//                                 style: const TextStyle(color: Colors.grey),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(height: 15),
//                               Text(
//                                 'description',
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                       ],
//                     ),
//                   ),
//                   Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(10),
//                       onTap: () {
//                         print('Tapped on movie: title');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
