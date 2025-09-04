import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/common/widgets/custom_btn.dart';
import 'package:sear_soqe/core/common/widgets/custom_outlined_button.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/onboarding/presentation/widgets/show_modal_button.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  showModalBottom(context, isLogin: true);
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomButton(
                text: 'انشاء حساب',
                onPressed: () {
                  showModalBottom(context, isLogin: false);
                },
                textColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),
        InkWell(
          onTap: () {
            context.push(RouterNames.bottomNavBar);
          },
          child: Text(
            'المتابعة للتطبيق كزائر',
            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 15.sp, color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
