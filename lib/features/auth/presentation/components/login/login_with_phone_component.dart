import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/forget_password_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/login/login_with_phone_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class LoginWithPhoneComponent extends StatelessWidget {
  const LoginWithPhoneComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            suffixIcon: InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  countryListTheme: CountryListThemeData(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  onSelect: (Country value) {
                    print(value.phoneCode);
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(width: 8.w),

                  SvgPicture.asset('assets/images/saudia.svg', height: 24.h),
                  SizedBox(width: 8.w),

                  Text('(+996)'),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down_sharp),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.phone,
            readOnly: true,
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: '01029673915',
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: ' كلمة المرور',
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text('لاتملك حساب ؟'),

              TextButton(
                onPressed: () {
                  context.push(RouterNames.registerWithPhone);
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
            progress: .3,
            title: 'تسجيل الدخول',
            trailing: Text(
              'نسيت كلمه المرور',
              style: TextStyle(color: AppColors.black),
            ),
            onTapTitle: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginWithPhoneView();
                  },
                ),
              );
            },
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
          ),
        ],
      ),
    );
  }
}
