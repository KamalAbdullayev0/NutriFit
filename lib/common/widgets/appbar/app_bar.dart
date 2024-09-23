import 'package:flutter/material.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? imagePath;
  final bool hideBack;
  const BasicAppbar({super.key, this.imagePath, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 249, 235, 235),
      elevation: 0,
      centerTitle: true,
      title: imagePath != null
          ? Image.asset(
              imagePath!,
              height: 40, // Adjust the size of the image
            )
          : const Text(''),
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                  color: AppColors.orange,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
