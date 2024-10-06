// import 'package:flutter/material.dart';
// import 'package:nutri_fit/core/configs/assets/app_images.dart';
// import 'package:nutri_fit/core/configs/theme/app_colors.dart';

// class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final String? imagePath;
//   final bool hideBack;
//   const BasicAppbar({super.key, this.imagePath, this.hideBack = false});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.green[300],
//       elevation: 0,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 'HI! Insanin adi',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           CircleAvatar(
//             backgroundImage: AssetImage(AppImages.ozun),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
