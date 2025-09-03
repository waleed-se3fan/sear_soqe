import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';
import 'package:sear_soqe/features/add_car/presentation/logic/cubit/add_car_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sear_soqe/features/home/presentation/widgets/category_widget.dart';

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
          BlocBuilder<AddCarCubit, AddCarState>(
            builder: (context, state) {
              if (state is ChangeIndex) {
                if (state.index == 0) {
                  return FlutterLogo();
                } else if (state.index == 1) {
                  return AddCarByRegionComponent();
                } else {}
              }
              return AddCarByAddingVedioComponent();
            },
          ),
        ],
      ),
    );
  }
}

class AddCarTitle extends StatelessWidget {
  final String title;
  const AddCarTitle({super.key, required this.title});

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

class AddCarBody extends StatelessWidget {
  final Widget widget;
  const AddCarBody({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: widget,
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
        AddCarTitle(title: 'فى اى مدينة توجد سيارتك ؟'),

        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 10.h),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,

                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('الرياض'),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 10),
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
        AddCarTitle(title: 'فى اى منطقة توجد سيارتك ؟'),
        AddCarBody(
          widget: Column(
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن منطقة توجد سيارتك',
                suffixIcon: Image.asset(
                  'assets/images/edit.png',
                  height: 20,
                  width: 20,
                ),
                fillColor: AppColors.fillGrey,
              ),
              SizedBox(height: 14.h),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
                //  fillColor: AppColors.fillGrey,
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('الرياض'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18),
                          SizedBox(width: 10),
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
        AddCarTitle(title: 'ما هو نوع سيارتك ؟'),

        AddCarBody(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              SizedBox(height: 10.h),
              Text('انواع مشهورة', style: AppStyles.ts16BlackW500),
              SizedBox(height: 10.h),

              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 180,
                  itemBuilder: (c, i) {
                    return CategoryWidget();
                  },
                ),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/my_car.png',

                            width: 60.w,
                            height: 60.h,
                          ),
                          SizedBox(width: 10),
                          Text('تويوتا'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18),
                          SizedBox(width: 10),
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

class AddCarByVersionComponent extends StatelessWidget {
  const AddCarByVersionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'ما هو إصدار سيارتك ؟'),
        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 14.h),
              CustomTextFormField(
                hintText: 'البحث عن نوع السيارة',
                suffixIcon: Icon(CupertinoIcons.search),
                //  fillColor: AppColors.fillGrey,
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('نوع السياره'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18),
                          SizedBox(width: 10),
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
        AddCarTitle(title: 'ما هو موديل سيارتك ؟'),
        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 14.h),
              CustomTextFormField(
                hintText: 'البحث عن نوع السيارة',
                suffixIcon: Icon(CupertinoIcons.search),
                //  fillColor: AppColors.fillGrey,
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('موديل السياره'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18),
                          SizedBox(width: 10),
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
        AddCarTitle(title: 'ما هو سنه صنع سيارتك ؟'),
        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 14.h),
              CustomTextFormField(
                hintText: 'البحث عن سنه الصنع',
                suffixIcon: Icon(CupertinoIcons.search),
                //  fillColor: AppColors.fillGrey,
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemExtent: 70,
                  itemBuilder: (c, i) {
                    return Card(
                      color: AppColors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('2020'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18),
                          SizedBox(width: 10),
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
        AddCarTitle(title: 'ما هو لون سيارتك ؟'),
        AddCarBody(widget: ColorPickerPage()),

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
        AddCarTitle(title: 'ما هوالسعر والمسافة المقطوعة لسيارتك ؟'),
        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 14.h),
              ListTile(
                title: Text('عدد الكيلو مترات المقطوعه'),
                subtitle: CustomTextFormField(
                  hintText: 'البحث عن سنه الصنع',
                  suffixIcon: Icon(CupertinoIcons.search),
                  //  fillColor: AppColors.fillGrey,
                ),
              ),

              SizedBox(height: 14.h),
              ListTile(
                title: Text('حدد السعر الخاص بك (الريال)'),
                subtitle: CustomTextFormField(
                  hintText: 'البحث عن سنه الصنع',
                  suffixIcon: Icon(CupertinoIcons.search),
                  //  fillColor: AppColors.fillGrey,
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
        AddCarTitle(title: 'ما هو سنه سيارتك ؟'),
        AddCarBody(widget: ConditionSelector()),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByFeaturesComponent extends StatelessWidget {
  const AddCarByFeaturesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'اضف مميزات ومواصفات السيارة'),
        AddCarBody(
          widget: SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('شكل السيارة'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        CategoryWidget(),
                        CategoryWidget(),
                        CategoryWidget(),
                        CategoryWidget(),
                        CategoryWidget(),
                        CategoryWidget(),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('عدد الابواب'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        OutlineItem(title: '1'),
                        OutlineItem(title: '2'),
                        OutlineItem(title: '3'),
                        OutlineItem(title: '4'),
                        OutlineItem(title: '5'),
                        OutlineItem(title: '6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('نوع الوقود'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        Container(child: Text('1')),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('محرك cc'),
                  subtitle: CustomTextFormField(
                    fillColor: AppColors.fillGrey,
                    hintText: '1300',
                  ),
                ),
                ListTile(
                  title: Text('عدد الابواب'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        Container(child: Text('1')),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('نوع ناقل الحركه'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        Container(child: Text('1')),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('نوع القياده'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        Container(child: Text('1')),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
              ],
            ),
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
        AddCarTitle(title: 'اضف مميزات ومواصفات السيارة'),
        AddCarBody(
          widget: SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('وصف'),
                  subtitle: CustomTextFormField(
                    hintText: 'صف حالة سيارتك واذكر تفاصيلها',
                    maxLines: 3,

                    fillColor: AppColors.fillGrey,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: SelectableListView(
                    items: [
                      OutlineItem(title: 'اعلى المواصفات'),
                      OutlineItem(title: 'متوسطة المواصفات'),
                      OutlineItem(title: 'تاريخ كامل الخدمة'),
                      OutlineItem(title: 'خالية من الحوادث'),
                    ],
                    onItemSelected: (value) {},
                  ),
                ),
                ListTile(
                  title: Text('نوع الوقود'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        Container(child: Text('1')),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarBySpecialFeaturesComponent extends StatelessWidget {
  const AddCarBySpecialFeaturesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'احصل على ميزات خاصه واجعل اعلانك مميزا'),
        AddCarBody(
          widget: SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('إظهار زر الواتساب'),
                  subtitle: Row(
                    children: [
                      Text(
                        'السماح للمشترين بالاتصال بك عبر الواتساب',
                        style: AppStyles.ts14GreyW400,
                      ),
                      Spacer(),
                      Switch(value: true, onChanged: (value) {}),
                    ],
                  ),
                ),

                ListTile(
                  title: Text('إخفاء تاريخ تغيير الاسعار'),
                  subtitle: Row(
                    children: [
                      Text(
                        'سيتم إخفاء سجل الاسعار فى القائمة',
                        style: AppStyles.ts14GreyW400,
                      ),
                      Spacer(),
                      Switch(value: false, onChanged: (value) {}),
                    ],
                  ),
                ),

                ListTile(
                  title: Text('إخفاء تاريخ اخر تحديث'),
                  subtitle: Row(
                    children: [
                      Text(
                        'سيتم إخفاء تاريخ اخر تحديث فى القائمة',
                        style: AppStyles.ts14GreyW400,
                      ),
                      Spacer(),
                      Switch(value: false, onChanged: (value) {}),
                    ],
                  ),
                ),

                ListTile(
                  title: Text('شارات'),
                  subtitle: SizedBox(
                    height: 100,
                    child: SelectableListView(
                      items: [
                        OutlineItem(title: 'مستعجل'),
                        OutlineItem(title: 'جيد'),
                        OutlineItem(title: 'بحاله جيده'),
                        OutlineItem(title: 'لا يوجد حوادث'),
                      ],
                      onItemSelected: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByAddingImagesComponent extends StatelessWidget {
  const AddCarByAddingImagesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'اضف ما يصل الى 5 صور للسيارة'),
        AddCarBody(
          widget: ListView(
            shrinkWrap: true,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.add), Text('الصورة الرئيسيه')],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    height: 150,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.add), Text('الصورة الرئيسيه')],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.add), Text('الصورة الرئيسيه')],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AddCarFooter(progress: .4),
      ],
    );
  }
}

class AddCarByAddingVedioComponent extends StatelessWidget {
  const AddCarByAddingVedioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'اضف 2 فيديو للسيارة ( اختياري )'),
        AddCarBody(
          widget: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'اختياري يمكنك تحميل ملفات مساحتها 100 ميغا كحد اقصي',
                style: AppStyles.ts14GreyW400,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(height: 10),

                    Text('رفع فيديو'),
                  ],
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

class ColorPickerPage extends StatelessWidget {
  ColorPickerPage({super.key});

  final List<Map<String, dynamic>> colors = [
    {"color": Color(0xFFBF7B30), "label": "Brown"},
    {"color": Color(0xFF1952A2), "label": "Blue"},
    {"color": Colors.black, "label": "Black"},
    {"color": Color(0xFFF6F5E7), "label": "Ivory"},
    {"color": Colors.green, "label": "Green"},
    {"color": Color(0xFFD4B037), "label": "Mustard"},
    {"color": Color(0xFF890C2C), "label": "Maroon"},
    {"color": Color(0xFFD1651E), "label": "Orange"},
    {"color": Colors.purple, "label": "Purple"},
    {"color": Colors.pink, "label": "Pink"},
    {"color": Colors.orange, "label": "Orange"},
    {"color": Colors.grey[300], "label": "Light Grey"},
    {"color": Colors.white, "label": "White"},
    {"color": Colors.yellow, "label": "Yellow"},
    {"color": Colors.grey, "label": "Grey"},
    {"color": Colors.red, "label": "Red"},
    {"color": Colors.cyan, "label": "Cyan"},
    {"color": Colors.teal, "label": "Teal"},
    {"color": Colors.brown[200], "label": "Beige"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: GridView.builder(
        itemCount: colors.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = colors[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 30, backgroundColor: item["color"]),
              const SizedBox(height: 8),
              Text(
                item["label"],
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ConditionSelector extends StatefulWidget {
  const ConditionSelector({super.key});

  @override
  _ConditionSelectorState createState() => _ConditionSelectorState();
}

class _ConditionSelectorState extends State<ConditionSelector> {
  String selected = "جديدة"; // default selected

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildOption("جديدة"),
        const SizedBox(height: 12),
        buildOption("مستعملة"),
      ],
    );
  }

  Widget buildOption(String text) {
    final bool isSelected = selected == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8F8FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primaryColor : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectableListView extends StatefulWidget {
  final List<Widget> items;
  final ValueChanged<Widget> onItemSelected;

  const SelectableListView({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<SelectableListView> createState() => _SelectableListViewState();
}

class _SelectableListViewState extends State<SelectableListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onItemSelected(widget.items[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),

              border: Border.all(
                color: isSelected ? Colors.blue : Colors.white,
              ),
            ),

            child: Center(child: widget.items[index]),
          ),
        );
      },
    );
  }
}

class OutlineItem extends StatelessWidget {
  const OutlineItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}

// class AddCarByAdditionalFeaturesComponent extends StatelessWidget {
//   const AddCarByAdditionalFeaturesComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
//         SizedBox(height: 50.h),

//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//           ),
//           child: Column(
//             children: [
//               CustomTextFormField(
//                 hintText: 'ابحث عن منطقة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),
//               CustomTextFormField(
//                 hintText: 'ابحث عن مدينة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),

//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemExtent: 50,
//                   itemBuilder: (c, i) {
//                     return Card(
//                       color: AppColors.white,
//                       child: Row(
//                         children: [
//                           Text('الرياض'),
//                           Spacer(),
//                           SvgPicture.asset(
//                             'assets/images/logo.svg',
//                             width: 24.w,
//                             height: 24.h,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         AddCarFooter(progress: .4),
//       ],
//     );
//   }
// }

// class AddCarByPrivateFeaturesAndSpecialCompainComponent
//     extends StatelessWidget {
//   const AddCarByPrivateFeaturesAndSpecialCompainComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
//         SizedBox(height: 50.h),

//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//           ),
//           child: Column(
//             children: [
//               CustomTextFormField(
//                 hintText: 'ابحث عن منطقة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),
//               CustomTextFormField(
//                 hintText: 'ابحث عن مدينة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),

//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemExtent: 50,
//                   itemBuilder: (c, i) {
//                     return Card(
//                       color: AppColors.white,
//                       child: Row(
//                         children: [
//                           Text('الرياض'),
//                           Spacer(),
//                           SvgPicture.asset(
//                             'assets/images/logo.svg',
//                             width: 24.w,
//                             height: 24.h,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         AddCarFooter(progress: .4),
//       ],
//     );
//   }
// }

// class AddCarByImagesComponent extends StatelessWidget {
//   const AddCarByImagesComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
//         SizedBox(height: 50.h),

//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//           ),
//           child: Column(
//             children: [
//               CustomTextFormField(
//                 hintText: 'ابحث عن منطقة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),
//               CustomTextFormField(
//                 hintText: 'ابحث عن مدينة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),

//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemExtent: 50,
//                   itemBuilder: (c, i) {
//                     return Card(
//                       color: AppColors.white,
//                       child: Row(
//                         children: [
//                           Text('الرياض'),
//                           Spacer(),
//                           SvgPicture.asset(
//                             'assets/images/logo.svg',
//                             width: 24.w,
//                             height: 24.h,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         AddCarFooter(progress: .4),
//       ],
//     );
//   }
// }

// class AddCarByOptionalVedioComponent extends StatelessWidget {
//   const AddCarByOptionalVedioComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         MainTitleWidget(title: 'فى اى نوع توجد سيارتك ؟'),
//         SizedBox(height: 50.h),

//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//           ),
//           child: Column(
//             children: [
//               CustomTextFormField(
//                 hintText: 'ابحث عن منطقة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),
//               CustomTextFormField(
//                 hintText: 'ابحث عن مدينة توجد سيارتك',
//                 suffixIcon: Icon(CupertinoIcons.search),
//               ),

//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemExtent: 50,
//                   itemBuilder: (c, i) {
//                     return Card(
//                       color: AppColors.white,
//                       child: Row(
//                         children: [
//                           Text('الرياض'),
//                           Spacer(),
//                           SvgPicture.asset(
//                             'assets/images/logo.svg',
//                             width: 24.w,
//                             height: 24.h,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         AddCarFooter(progress: .4),
//       ],
//     );
//   }
// }
