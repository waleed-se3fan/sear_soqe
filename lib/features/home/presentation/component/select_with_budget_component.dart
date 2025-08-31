import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/home/presentation/view/home_view.dart';
import 'package:sear_soqe/features/home/presentation/widgets/category_widget.dart';

class SelectWithBudgetComponent extends StatelessWidget {
  const SelectWithBudgetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'حسب الميزانية',
                style: TextStyle(color: AppColors.black, fontSize: 16.sp),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    'استعراض الكل',
                    style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.blue,
                    size: 14.sp,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'ابحث عن سيارات بسعر محدد',
            style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              //  physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return const CategoryWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
