import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/login/login_with_phone_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/login/login_with_email_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_email_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_phone_view.dart';

showModalBottom(BuildContext context, {required bool isLogin}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  isLogin ? 'تسجيل الدخول' : 'انشاء حساب جديد',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return isLogin
                          ? LoginWithPhoneView()
                          : RegisterWithPhoneView();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.phone_iphone),
                    SizedBox(width: 8.w),
                    Text(' المتابعه من خلال رقم الهاتف '),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return isLogin
                          ? LoginWithEmailView()
                          : RegisterWithEmailView();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(width: 8.w),
                    Text(' المتابعه من خلال البريد الالكتروني '),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
