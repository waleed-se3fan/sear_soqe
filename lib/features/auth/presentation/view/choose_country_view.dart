import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/routes/router_names.dart';

class ChooseCountryView extends StatelessWidget {
  const ChooseCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    List countryName = [
      'مصر',
      'السعودية',
      'الكويت',
      'البحرين',
      'الإمارات',
      'قطر',
      'عمان',
    ];
    List countryFlag = [
      'assets/images/egypt.svg',
      'assets/images/saudia.svg',
      'assets/images/kwit.svg',
      'assets/images/bahreen.svg',
      'assets/images/emirates.svg',
      'assets/images/qatar.svg',
      'assets/images/oman.svg',
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('اختر الدولة', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20.h),
              Text(
                'سوف تستخدم هذا البريد الالكتروني للدخول للتطبيق واستعاده البريد الالكتروني',

                style: TextStyle(fontSize: 12.sp, color: Colors.black45),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: countryName.length,
                  itemBuilder: (context, index) {
                    return CountryCard(
                      countryName: countryName[index],
                      countryFlag: countryFlag[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String countryName;
  final String countryFlag;
  const CountryCard({
    super.key,
    required this.countryName,
    required this.countryFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            context.go(RouterNames.bottomNavBar);
          },
          child: Row(
            children: [
              SvgPicture.asset(countryFlag),
              SizedBox(width: 20.w),

              Text(countryName),
            ],
          ),
        ),
      ),
    );
  }
}
