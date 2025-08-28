import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class CustomFooterWidget extends StatelessWidget {
  final double progress;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTapTitle;
  final VoidCallback? onTapTrailing;
  const CustomFooterWidget({
    super.key,
    required this.progress,
    required this.title,
    this.trailing,
    this.onTapTitle,
    this.onTapTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          color: AppColors.primaryColor,
          backgroundColor: AppColors.fillGrey,
          minHeight: 6.h,
          borderRadius: BorderRadius.circular(12.r),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            InkWell(
              onTap: onTapTitle,
              child: Text(
                title,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            Spacer(),
            InkWell(onTap: onTapTrailing, child: trailing),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
