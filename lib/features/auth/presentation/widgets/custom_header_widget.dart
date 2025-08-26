import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAuthHeaderWidget extends StatelessWidget {
  final String title;
  const CustomAuthHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/images/close.svg', height: 24.h),
          ),
          SizedBox(height: 23.h),
          Text(title),
        ],
      ),
    );
  }
}
