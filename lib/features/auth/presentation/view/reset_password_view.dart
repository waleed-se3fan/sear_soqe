import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAuthHeaderWidget(title: 'تعيين كلمه المرور الجديده'),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: ' كلمه المرور ',
                fillColor: AppColors.lightGrey,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: ' تأكيد كلمه المرور ',
                fillColor: AppColors.lightGrey,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              Spacer(),
              CustomFooterWidget(
                progress: 1,
                title: 'تاكيد والمتابعه',
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
