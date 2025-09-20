import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/home_logo.svg',
          height: 65.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'هناك حقيقة مثبتة منذ زمن طويل',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيُلهي القارئ عن التركيز على الشكل الخارجي للنص',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, height: 1.4, color: Colors.black54),
        ),
      ],
    );
  }
}
