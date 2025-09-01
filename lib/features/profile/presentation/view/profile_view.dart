import 'package:flutter/material.dart';
import 'package:sear_soqe/features/car_details/presentation/view/car_details_view.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const ProfileHeaderWidget(),
              const SizedBox(height: 16),
              const SellYourCarWidget(),
              const SizedBox(height: 24),
              const ProfileSectionWidget(title: "إعلاناتي"),
              ProfileTile(
                title: "إعلاناتي",
                icon: Icons.list_alt,
                onTap: () {},
              ),
              ProfileTile(
                title: "إعلاناتي المفضلة",
                icon: Icons.favorite_border,
                onTap: () {},
              ),
              ProfileTile(title: "بيع سيارتك", icon: Icons.add, onTap: () {}),
              const SizedBox(height: 16),
              const ProfileSectionWidget(title: "استكشف"),
              ProfileTile(
                title: "دليل المشترين",
                icon: Icons.menu_book_outlined,
                onTap: () {},
              ),
              ProfileTile(
                title: "أخبار السيارات",
                icon: Icons.newspaper,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              const ProfileSectionWidget(title: "إعدادات"),
              ProfileTile(
                title: "اللغه",
                icon: Icons.language,
                secondary: "العربية",
                onTap: () {},
              ),
              ProfileTile(
                title: "الدولة",
                icon: Icons.location_on_outlined,
                secondary: "السعودية",
                onTap: () {},
              ),

              const SizedBox(height: 16),

              const ProfileSectionWidget(title: "الدعم"),
              ProfileTile(
                title: "من نحن",
                icon: Icons.info_outline,
                onTap: () {},
              ),
              ProfileTile(title: "اتصل بنا", icon: Icons.phone, onTap: () {}),
              ProfileTile(
                title: "اعلن معنا",
                icon: Icons.campaign_outlined,
                onTap: () {},
              ),
              ProfileTile(
                title: "حذف الحساب",
                icon: Icons.delete_outline,
                onTap: () {},
              ),

              const SizedBox(height: 16),

              const ProfileSectionWidget(title: "القوانين والأحكام"),
              ProfileTile(
                title: "شروط الاستخدام",
                icon: Icons.lock_outline,
                onTap: () {},
              ),
              ProfileTile(
                title: "سياسة الخصوصية",
                icon: Icons.privacy_tip_outlined,
                onTap: () {},
              ),

              const SizedBox(height: 24),
              ProfileTile(
                title: "تسجيل الخروج",
                titleColor: Colors.red,
                icon: Icons.logout,
                onTap: () {},
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
