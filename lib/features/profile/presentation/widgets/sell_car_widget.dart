import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';

class SellYourCarWidget extends StatelessWidget {
  const SellYourCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/car-key.png', width: 50, height: 50),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("هل تريد بيع سيارتك مجانا؟", style: AppStyles.ts14W400),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},

                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.primaryColor,
                    ),
                    child: Text("بعها بنفسك", style: AppStyles.ts14W600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
