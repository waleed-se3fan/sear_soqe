import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/components/register/register_with_phone_component.dart';
import 'package:sear_soqe/features/auth/presentation/view/verification_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';
import 'package:country_picker/country_picker.dart';

class RegisterWithPhoneView extends StatelessWidget {
  const RegisterWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
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
