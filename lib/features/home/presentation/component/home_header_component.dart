import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/home_logo.svg',
          height: 45,
          width: 45,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            context.setLocale(
              context.locale.languageCode == 'ar'
                  ? const Locale('en')
                  : const Locale('ar'),
            );
          },
          child: Text(
            context.locale.languageCode == 'ar' ? 'English' : 'العربية',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
