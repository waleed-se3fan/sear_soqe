import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/home/presentation/widgets/category_widget.dart';

class SelectWithCategoryComponent extends StatelessWidget {
  const SelectWithCategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Container(
        height: 230.h,
        padding: EdgeInsets.only(right: 14.w, top: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              'حسب الفئه',
              style: TextStyle(color: AppColors.black, fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              'ابحث عن السيارات المستعملة عبر فئات منتقاه بعناية',
              style: TextStyle(color: AppColors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 10.h),
            TabBar(
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              labelStyle: TextStyle(fontSize: 14.sp),
              unselectedLabelStyle: TextStyle(fontSize: 14.sp),
              dividerColor: Colors.transparent,

              tabs: [
                Tab(text: 'شكل السياره'),
                Tab(text: 'الماركه'),
                Tab(text: 'الوقود المستخدم'),
                Tab(text: 'السنه'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,

                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryWidget();
                    },
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,

                      childAspectRatio: 1,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryWidget();
                    },
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,

                      childAspectRatio: 1,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryWidget();
                    },
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,

                      childAspectRatio: 1,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryWidget();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
