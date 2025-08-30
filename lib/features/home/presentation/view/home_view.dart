import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: 0,
          onTap: (index) {},
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 22,
                height: 22,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/favourite.svg'),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/add_car.svg',
                // width: 50,
                // height: 50,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/notification.svg'),
              label: 'التنبيهات',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/more.svg'),
              label: 'المزيد',
            ),
          ],
        ),
      ),

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
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/home_logo.svg'),
                        Spacer(),
                        Text('English', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    CountrySearchComponent(),
                    CustomTextFormField(
                      hintText: 'ابحث عن سيارات مستعملة هنا ..',
                      suffixIcon: Icon(CupertinoIcons.search),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        HomeOptionWidget(
                          image: 'assets/images/my_car.png',
                          title: 'شراء سيارة',
                        ),
                        HomeOptionWidget(
                          image: 'assets/images/car-key.png',
                          title: 'بيع سيارة',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        HomeOptionWidget(
                          image: 'assets/images/compass.png',
                          title: 'دليل السياره',
                        ),
                        HomeOptionWidget(
                          image: 'assets/images/newspaper.png',
                          title: 'اخبار السيارات',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            DefaultTabController(
              initialIndex: 0,
              length: 5,

              child: Container(
                height: 230.h,
                padding: EdgeInsets.only(right: 14.w, top: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
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
                        Tab(text: 'المدينه'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
            ),
            SelectWithBudget(),
          ],
        ),
      ),
    );
  }
}

class HomeOptionWidget extends StatelessWidget {
  const HomeOptionWidget({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white.withValues(alpha: 0.2),
          ),
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(width: 10.w),
              Text(title, style: TextStyle(color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topRight, child: Text('الماركه')),
            SizedBox(height: 4.h),
            Image.asset('assets/images/car_category.png'),
          ],
        ),
      ),
    );
  }
}

class CountrySearchComponent extends StatefulWidget {
  const CountrySearchComponent({super.key});

  @override
  State<CountrySearchComponent> createState() => _CountrySearchComponentState();
}

class _CountrySearchComponentState extends State<CountrySearchComponent> {
  String _selectedCountry = 'SA';

  final Map<String, String> _countryFlags = const {
    'SA': 'assets/images/saudia.svg',
    'EG': 'assets/images/egypt.svg',
    'QA': 'assets/images/qatar.svg',
    'BH': 'assets/images/bahreen.svg',
    'AE': 'assets/images/emirates.svg',
    'KW': 'assets/images/kwit.svg',
    'OM': 'assets/images/oman.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "مرحباً Mohamed Ahmed",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "إبحث عن السيارات في",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCountry,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  dropdownColor: const Color(0xFF6A1FBF),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _selectedCountry = value);
                  },
                  items: _countryFlags.entries.map((e) {
                    return DropdownMenuItem<String>(
                      value: e.key,
                      child: Row(
                        children: [
                          SvgPicture.asset(e.value, width: 20, height: 14),
                          const SizedBox(width: 6),
                          Text(
                            e.key,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}

class SelectWithBudget extends StatelessWidget {
  const SelectWithBudget({super.key});

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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) {
              return const CategoryWidget();
            },
          ),
        ],
      ),
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const _HeaderSection(),
//               const SizedBox(height: 16),
//               const _SearchBar(),
//               const SizedBox(height: 16),
//               const _ActionButtons(),
//               const SizedBox(height: 24),
//               const _CategoryTabs(),
//               const SizedBox(height: 16),
//               const _BrandsGrid(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//}

// //////////////// HEADER ////////////////////
// class _HeaderSection extends StatefulWidget {
//   const _HeaderSection();

//   @override
//   State<_HeaderSection> createState() => _HeaderSectionState();
// }

// class _HeaderSectionState extends State<_HeaderSection> {
//   String _selectedCountry = 'SA';

//   final Map<String, String> _countryFlags = const {
//     'SA': 'assets/images/saudia.svg',
//     'EG': 'assets/images/egypt.svg',
//     'QA': 'assets/images/qatar.svg',
//     'BH': 'assets/images/bahreen.svg',
//     'AE': 'assets/images/emirates.svg',
//     'KW': 'assets/images/kwit.svg',
//     'OM': 'assets/images/oman.svg',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF7A1FFF), Color(0xFFE14BE5)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   SvgPicture.asset('assets/images/logo.svg', height: 28),
//                   const SizedBox(width: 8),
//                   const Text(
//                     "سحر السوق",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "English",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "مرحباً Mohamed Ahmed",
//             style: TextStyle(
//               fontSize: 22,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     value: _selectedCountry,
//                     icon: const Icon(
//                       Icons.keyboard_arrow_down_rounded,
//                       color: Colors.white,
//                     ),
//                     dropdownColor: const Color(0xFF6A1FBF),
//                     style: const TextStyle(color: Colors.white),
//                     onChanged: (value) {
//                       if (value == null) return;
//                       setState(() => _selectedCountry = value);
//                     },
//                     items: _countryFlags.entries.map((e) {
//                       return DropdownMenuItem<String>(
//                         value: e.key,
//                         child: Row(
//                           children: [
//                             SvgPicture.asset(e.value, width: 20, height: 14),
//                             const SizedBox(width: 6),
//                             Text(
//                               e.key,
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 "إبحث عن السيارات في",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// //////////////// SEARCH BAR ////////////////////
// class _SearchBar extends StatelessWidget {
//   const _SearchBar();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: "إبحث عن سيارات مستعملة هنا ..",
//           prefixIcon: const Icon(Icons.search),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           filled: true,
//           fillColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// //////////////// ACTION BUTTONS ////////////////////
// class _ActionButtons extends StatelessWidget {
//   const _ActionButtons();

//   @override
//   Widget build(BuildContext context) {
//     final actions = [
//       {"title": "بيع السيارة", "icon": Icons.visibility},
//       {"title": "شراء سيارة", "icon": Icons.directions_car},
//       {"title": "أخبار السيارات", "icon": Icons.article},
//       {"title": "دليل السيارة", "icon": Icons.help},
//     ];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         itemCount: actions.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2.8,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//         ),
//         itemBuilder: (context, index) {
//           final action = actions[index];
//           return ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               foregroundColor: Colors.deepPurple,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//             ),
//             onPressed: () {},
//             icon: Icon(action["icon"] as IconData),
//             label: Text(action["title"] as String),
//           );
//         },
//       ),
//     );
//   }
// }

// //////////////// CATEGORY TABS ////////////////////
// class _CategoryTabs extends StatelessWidget {
//   const _CategoryTabs();

//   @override
//   Widget build(BuildContext context) {
//     final categories = [
//       "شكل السيارة",
//       "البركة",
//       "المستخدم",
//       "الوقود",
//       "السنة",
//       "المدينة",
//     ];

//     return SizedBox(
//       height: 40,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: categories.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 12),
//         itemBuilder: (context, index) {
//           return Chip(
//             label: Text(categories[index]),
//             backgroundColor: index == 1
//                 ? Colors.deepPurple
//                 : Colors.grey.shade200,
//             labelStyle: TextStyle(
//               color: index == 1 ? Colors.white : Colors.black,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// //////////////// BRANDS GRID ////////////////////
// class _BrandsGrid extends StatelessWidget {
//   const _BrandsGrid();

//   @override
//   Widget build(BuildContext context) {
//     final brands = [
//       {
//         "name": "تويوتا",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/9/9d/Toyota_carlogo.png",
//       },
//       {
//         "name": "هيونداي",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/4/44/Hyundai_logo.png",
//       },
//       {
//         "name": "ميتسوبيشي",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/6/63/Mitsubishi_logo.svg",
//       },
//       {
//         "name": "كيا",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/6/6d/Kia_logo.png",
//       },
//       {
//         "name": "شيفروليه",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/8/88/Chevrolet_logo.png",
//       },
//       {
//         "name": "لكزس",
//         "logo":
//             "https://upload.wikimedia.org/wikipedia/commons/1/19/Lexus_division_emblem.png",
//       },
//     ];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         itemCount: brands.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 1,
//           mainAxisSpacing: 16,
//           crossAxisSpacing: 16,
//         ),
//         itemBuilder: (context, index) {
//           final brand = brands[index];
//           return Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   padding: const EdgeInsets.all(8),
//                   child: Image.network(brand["logo"]!, fit: BoxFit.contain),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 brand["name"]!,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
