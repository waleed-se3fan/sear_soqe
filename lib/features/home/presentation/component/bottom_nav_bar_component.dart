import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/app_cubit/app_cubit.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/features/home/presentation/widgets/bottom_nav_bar_widget.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.r,
      left: 2.w,
      right: 2.w,
      child: Container(
        height: 90.r,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.r,
              spreadRadius: 2.r,
              offset: Offset(0, 4.r),
            ),
          ],
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              image: 'assets/images/logo.svg',
              title: 'الرئيسية',
              onTap: () {
                context.read<AppCubit>().changeBottomNavBarSelectedIndex(0);
              },
            ),
            BottomNavBarItem(
              image: 'assets/images/favourite.svg',
              title: 'المفضلة',
              onTap: () {
                context.read<AppCubit>().changeBottomNavBarSelectedIndex(1);
              },
            ),
            InkWell(
              onTap: () {
                context.go(RouterNames.addCar);
              },
              child: SvgPicture.asset(
                'assets/images/add_car.svg',
                height: 85.r,
                width: 85.r,
              ),
            ),
            BottomNavBarItem(
              image: 'assets/images/notification.svg',
              title: 'الاشعارات',
              onTap: () {
                context.read<AppCubit>().changeBottomNavBarSelectedIndex(3);
              },
            ),

            BottomNavBarItem(
              image: 'assets/images/more.svg',
              title: 'المزيد',
              onTap: () {
                context.read<AppCubit>().changeBottomNavBarSelectedIndex(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
