import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/home/presentation/widgets/popular_widget.dart';

class SelectWithPopularityComponent extends StatelessWidget {
  const SelectWithPopularityComponent({super.key});

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
                'السيارات الاكثر شهرة',
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
            'السيارات الاكتر شهرة على تطبيقنا والاكثر طلبآ',
            style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              //  physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return const PopularWidget(
                  imageUrl: "assets/images/popular-car.png",
                  title: "تويونا فيلوز 1.5 لتر GLX 2024",
                  date: "Mar 06,2025",
                  price: "رس 2,300,00",
                  city: "الرياض",
                  year: "2024",
                  fuel: "بنزين",
                  km: "0 كم",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
