import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/choose_country_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/forget_password_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class LoginWithEmailComponent extends StatelessWidget {
  const LoginWithEmailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'ادخل البريد الالكتروني',
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: 'ادخل كلمة المرور',
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 60.h),
          Row(
            children: [
              Text('لاتملك حساب ؟'),

              TextButton(
                onPressed: () {
                  context.push(RouterNames.registerWithEmail);
                },
                child: Text(
                  'قم انشاء حساب',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          CustomFooterWidget(
            progress: 1,
            trailing: Text('نسيت كلمه المرور'),
            title: 'تسجيل الدخول',

            onTapTrailing: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ForgetPasswordView();
                  },
                ),
              );
            },
            onTapTitle: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ChooseCountryView();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
