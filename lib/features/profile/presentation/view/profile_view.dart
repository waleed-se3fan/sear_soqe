import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:sear_soqe/features/profile/presentation/widgets/profile_section_widget.dart';
import 'package:sear_soqe/features/profile/presentation/widgets/profile_tile.dart';
import 'package:sear_soqe/features/profile/presentation/widgets/sell_car_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              ProfileHeaderWidget(),
              SizedBox(height: 16),
              SellYourCarWidget(),
              SizedBox(height: 24),
              ProfileSectionWidget(title: "إعلاناتي"),
              ProfileTile(
                title: "إعلاناتي",
                icon: Icons.list_alt,
                onTap: () => context.go(RouterNames.myAds),
              ),
              ProfileTile(
                title: "إعلاناتي المفضلة",
                icon: Icons.favorite_border,
                onTap: () => context.go(RouterNames.myAds),
              ),
              ProfileTile(title: "بيع سيارتك", icon: Icons.add, onTap: null),
              SizedBox(height: 16),
              ProfileSectionWidget(title: "استكشف"),
              ProfileTile(
                title: "دليل المشترين",
                icon: Icons.menu_book_outlined,
                onTap: null,
              ),
              ProfileTile(
                title: "أخبار السيارات",
                icon: Icons.newspaper,
                onTap: null,
              ),
              SizedBox(height: 16),

              ProfileSectionWidget(title: "إعدادات"),
              ProfileTile(
                title: "اللغه",
                icon: Icons.language,
                secondary: "العربية",
                onTap: null,
              ),
              ProfileTile(
                title: "الدولة",
                icon: Icons.location_on_outlined,
                secondary: "السعودية",
                onTap: null,
              ),

              SizedBox(height: 16),

              ProfileSectionWidget(title: "الدعم"),
              ProfileTile(
                title: "من نحن",
                icon: Icons.info_outline,
                onTap: null,
              ),
              ProfileTile(title: "اتصل بنا", icon: Icons.phone, onTap: null),
              ProfileTile(
                title: "اعلن معنا",
                icon: Icons.campaign_outlined,
                onTap: null,
              ),
              ProfileTile(
                title: "حذف الحساب",
                icon: Icons.delete_outline,
                onTap: null,
              ),

              SizedBox(height: 16),

              ProfileSectionWidget(title: "القوانين والأحكام"),
              ProfileTile(
                title: "شروط الاستخدام",
                icon: Icons.lock_outline,
                onTap: null,
              ),
              ProfileTile(
                title: "سياسة الخصوصية",
                icon: Icons.privacy_tip_outlined,
                onTap: null,
              ),

              SizedBox(height: 24),
              ProfileTile(
                title: "تسجيل الخروج",
                titleColor: Colors.red,
                icon: Icons.logout,
                onTap: () {
                  context.go(RouterNames.onboarding);
                },
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
