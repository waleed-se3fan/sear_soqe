import 'package:flutter/cupertino.dart';
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
          color: AppColors.white,
        ),
        Spacer(),
        Text('English', style: TextStyle(color: AppColors.white)),
      ],
    );
  }
}
