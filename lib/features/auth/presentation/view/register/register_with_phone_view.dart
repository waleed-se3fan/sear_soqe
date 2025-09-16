import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/features/auth/presentation/components/register/register_with_phone_component.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';

class RegisterWithPhoneView extends StatelessWidget {
  const RegisterWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20),
          child: Column(
            children: [
              CustomAuthHeaderWidget(title: 'أنشاء حساب جديد برقم الهاتف'),
              SizedBox(height: 20.h),
              Text(
                'سوف تستخدم هذا رقم الجوال للدخول للتطبيق واستعاده البريد الالكتروني',
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.2,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 20.h),
              RegisterWithPhoneComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
