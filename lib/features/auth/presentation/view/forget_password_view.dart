import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/reset_password_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAuthHeaderWidget(title: 'نسيت كلمه المرور'),
              SizedBox(height: 20.h),
              Text(
                'لا تقلق تم ارسال كود الى البريد الالكتروني لاستعاده حسابك',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.2,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: 'ادخل البريد الالكتروني',
                fillColor: AppColors.lightGrey,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),

              Spacer(),
              CustomFooterWidget(
                progress: 1,
                title: 'المتابعه',
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ResetPasswordView();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
