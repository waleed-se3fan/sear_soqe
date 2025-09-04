import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/features/home/presentation/component/country_search_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_budget_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_category_component.dart';
import 'package:sear_soqe/features/home/presentation/component/select_with_popularity_component.dart';
import 'package:sear_soqe/features/home/presentation/widgets/home_actions_widget.dart';
import 'package:sear_soqe/features/home/presentation/component/home_header_component.dart';

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
                    const SizedBox(height: 8),

                    const CountrySearchComponent(),
                    const CustomTextFormField(
                      hintText: 'ابحث عن سيارات مستعملة هنا ..',
                      suffixIcon: Icon(CupertinoIcons.search),
                    ),
                    const SizedBox(height: 10),
                    const HomeActionsWidget(),
                  ],
                ),
              ),
            ),
            const SelectWithCategoryComponent(),
            const SelectWithBudgetComponent(),
            const SelectWithPopularityComponent(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
