import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/features/auth/presentation/view/verification_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class RegisterWithPhoneComponent extends StatelessWidget {
  const RegisterWithPhoneComponent({super.key});

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
          Spacer(),
          CustomFooterWidget(
            onTapTitle: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) {
                    return VerificationView();
                  },
                ),
              );
            },
            progress: 0.3,
            title: 'المتابعه',
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
