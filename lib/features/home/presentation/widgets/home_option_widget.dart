import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class HomeOptionWidget extends StatelessWidget {
  const HomeOptionWidget({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white.withValues(alpha: 0.2),
          ),
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(width: 10.w),
              Text(title, style: TextStyle(color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
