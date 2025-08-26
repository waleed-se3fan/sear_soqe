import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/view/create_account_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register_with_phone_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              CustomAuthHeaderWidget(title: 'ادخل الكود المرسل'),
              SizedBox(height: 20.h),
              Text(
                'تم اسال كود فى رسالة قصيرة يرجي ادخال الكود المرسل',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.2,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 20.h),
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12.r),
                  fieldHeight: 52.h,
                  fieldWidth: 52.w,
                  selectedFillColor: AppColors.secondGrey,
                  inactiveColor: AppColors.lightBorderGrey,
                  activeColor: AppColors.primaryColor,
                  inactiveFillColor: AppColors.grey,
                  activeFillColor: AppColors.primaryColor,
                ),
                cursorColor: AppColors.primaryColor,
              ),

              SizedBox(height: 20.h),
              Spacer(),
              CustomFooterWidget(
                progress: 0.3,
                title: 'انشاء الحساب',
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateAccountView();
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
