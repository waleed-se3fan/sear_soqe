import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/covery.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 150),
                SvgPicture.asset(
                  'assets/images/congratulation.svg',
                  height: 210,
                  width: 239,
                ),
                Text(
                  'تم نشر إعلانك سيبدا فى الظهور فى نتائج البحث خلال بعض دقائق',
                  style: AppStyles.ts16WhiteW400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CustomCongratulationButton(
                    //   onPressed: () {},
                    //   child: TextButton.icon(
                    //     onPressed: () {},
                    //     label: Text('عرض الإعلان'),
                    //     icon: Icon(Icons.remove_red_eye_outlined),
                    //   ),
                    // // ),
                    // CustomCongratulationButton(
                    //   onPressed: () {},
                    //   child: TextButton.icon(
                    //     onPressed: () {},
                    //     label: Text('عرض الإعلان'),
                    //     icon: Icon(Icons.edit_outlined),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 20),
                // CustomCongratulationButton(
                //   onPressed: () {},
                //   child: Text('اعلاناتي'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCongratulationButton extends ElevatedButton {
  const CustomCongratulationButton({
    required super.onPressed,
    super.key,
    required super.child,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
      child: child,
    );
  }
}
