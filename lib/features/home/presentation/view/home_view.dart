import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/home/presentation/component/bottom_nav_bar_component.dart';
import 'package:sear_soqe/features/home/presentation/component/country_search_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_budget_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_category_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_popularity_component.dart';
import 'package:sear_soqe/features/home/presentation/widgets/home_actions_widget.dart';
import 'package:sear_soqe/features/home/presentation/component/home_header_component.dart';
import 'package:sear_soqe/features/home/presentation/widgets/popular_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/covery.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HomeHeaderComponent(),
                    SizedBox(height: 8.h),

                    CountrySearchComponent(),
                    CustomTextFormField(
                      hintText: 'ابحث عن سيارات مستعملة هنا ..',
                      suffixIcon: Icon(CupertinoIcons.search),
                    ),
                    SizedBox(height: 10.h),
                    HomeActionsWidget(),
                  ],
                ),
              ),
            ),

            SelectWithCategoryComponent(),

            SelectWithBudgetComponent(),
            SelectWithPopularityComponent(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
