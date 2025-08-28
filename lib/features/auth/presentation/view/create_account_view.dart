import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/forget_password_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              CustomAuthHeaderWidget(title: 'ادخل اسمك الكامل'),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: 'ادخل اسمك الاول',
                fillColor: AppColors.lightGrey,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: 'ادخل اسمك الاخير',
                fillColor: AppColors.lightGrey,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              Spacer(),
              CustomFooterWidget(
                progress: 0.05,
                trailing: Icon(Icons.arrow_forward),
                title: 'المتابعه',
                onTapTitle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ForgetPasswordView();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
