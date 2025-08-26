import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class CustomFooterWidget extends StatelessWidget {
  final double progress;
  final String title;
  final Widget? trailing;
  const CustomFooterWidget({
    super.key,
    required this.progress,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.primaryColor,
          color: AppColors.fillGrey,
          minHeight: 6.h,
          borderRadius: BorderRadius.circular(12.r),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            if (trailing != null) trailing!,
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                title,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
