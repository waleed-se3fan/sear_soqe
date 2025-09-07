import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class AdsTabBarComponent extends StatelessWidget {
  const AdsTabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.white,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      tabs: [
        Text('نشط (3)'),
        Text('بانتظار المراجعة (0)'),
        Text('قيد الانتظار (0)'),
      ],
    );
  }
}
