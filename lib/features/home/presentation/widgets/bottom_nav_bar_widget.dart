import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class BottomNavBarItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image, height: 24.h, width: 24.w),
          SizedBox(height: 5.h),
          Text(
            title,
            style: TextStyle(color: AppColors.black, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
