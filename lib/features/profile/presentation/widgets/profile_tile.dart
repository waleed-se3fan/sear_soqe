import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? secondary;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? titleColor;

  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.secondary,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(icon, color: iconColor ?? AppColors.primaryColor),

                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.ts14BlackW500),
                      if (secondary != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            secondary!,
                            style: AppStyles.ts16BlueW500,
                          ),
                        ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        const Divider(thickness: .5),
      ],
    );
  }
}
