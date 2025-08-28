import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/components/register/register_with_email_component.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

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
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.2,
                  color: Colors.black45,
                ),
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
