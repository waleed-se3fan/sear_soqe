import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.primaryColor.withValues(alpha: 0.15),
          child: Text("MA", style: AppStyles.ts14W600),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohamed Ahmed",
              textAlign: TextAlign.center,
              style: AppStyles.ts20W500,
            ),
            SizedBox(height: 4),
            Text(
              "info@gmail.com",
              textAlign: TextAlign.center,
              style: AppStyles.ts14W300,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/edit.svg'),
        ),
      ],
    );
  }
}
