import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';

import 'package:sear_soqe/features/auth/presentation/components/register/register_with_email_component.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';

class RegisterWithEmailView extends StatelessWidget {
  const RegisterWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              CustomAuthHeaderWidget(
                title: 'انشاء حساب جديد بالبريد الالكتروني',
              ),
              SizedBox(height: 20.h),
              Text(
                'سوف تستخدم هذا البريد الالكتروني للدخول للتطبيق واستعاده البريد الالكتروني',
                style: AppStyles.ts12GreyW400,
              ),
              SizedBox(height: 20.h),
              RegisterWithEmailComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
