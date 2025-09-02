import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class AddCarView extends StatelessWidget {
  const AddCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/covery.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          AddCarByCityComponent(),
        ],
      ),
    );
  }
}

class MainTitleWidget extends StatelessWidget {
  final String title;
  const MainTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Text(title, style: AppStyles.ts20WhiteW500),
          Spacer(),
          SvgPicture.asset(
            'assets/images/close.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

class AddCarFooter extends StatelessWidget {
  final double progress;
  const AddCarFooter({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Text('التالي'),
                  label: Icon(Icons.arrow_forward),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textColor,
                  ),
                  child: Text(
                    'الخلف',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class AddCarByCityComponent extends StatelessWidget {
  const AddCarByCityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى مدينة توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .2),
      ],
    );
  }
}

class AddCarByRegionComponent extends StatelessWidget {
  const AddCarByRegionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى منطقة توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByTypeComponent extends StatelessWidget {
  const AddCarByTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByModelComponent extends StatelessWidget {
  const AddCarByModelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByYearComponent extends StatelessWidget {
  const AddCarByYearComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByColorComponent extends StatelessWidget {
  const AddCarByColorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarBySeniorityComponent extends StatelessWidget {
  const AddCarBySeniorityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByPriceAndDistanceComponent extends StatelessWidget {
  const AddCarByPriceAndDistanceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByMainFeaturesComponent extends StatelessWidget {
  const AddCarByMainFeaturesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByAdditionalFeaturesComponent extends StatelessWidget {
  const AddCarByAdditionalFeaturesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByPrivateFeaturesAndSpecialCompainComponent
    extends StatelessWidget {
  const AddCarByPrivateFeaturesAndSpecialCompainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByImagesComponent extends StatelessWidget {
  const AddCarByImagesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByOptionalVedioComponent extends StatelessWidget {
  const AddCarByOptionalVedioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
        SizedBox(height: 50.h),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 50,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}
