import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Curves, Tween;
import 'package:flutter/widgets.dart' show CurveTween;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/app_cubit/app_cubit.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/add_car/presentation/logic/cubit/add_car_cubit.dart';
import 'package:sear_soqe/features/add_car/presentation/view/add_car_view.dart';
import 'package:sear_soqe/features/add_car/presentation/view/congratulation_view.dart';
import 'package:sear_soqe/features/add_car/presentation/view/my_ads_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/choose_country_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_email_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_phone_view.dart';
import 'package:sear_soqe/features/bottom_nav_bar_view.dart';
import 'package:sear_soqe/features/details/presentation/views/car_detail_view.dart';
import 'package:sear_soqe/features/details/presentation/views/features_page.dart';
import 'package:sear_soqe/features/filter_car/presentation/view/filter_view.dart';
import 'package:sear_soqe/features/home/presentation/view/home_view.dart';
import 'package:sear_soqe/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:sear_soqe/splash_view.dart';

final GoRouter router = GoRouter(
  initialLocation: RouterNames.splash,

  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterNames.featuresPage,
      builder: (context, state) => const FeaturesPage(),
    ),
    GoRoute(
      path: RouterNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),

    GoRoute(
      path: RouterNames.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouterNames.bottomNavBar,
      builder: (context, state) => BlocProvider(
        create: (context) => AppCubit(),
        child: const BottomNavBarView(),
      ),
    ),
    GoRoute(
      path: RouterNames.registerWithPhone,
      builder: (context, state) => const RegisterWithPhoneView(),
    ),
    GoRoute(
      path: RouterNames.registerWithEmail,
      builder: (context, state) => RegisterWithEmailView(),
    ),
    GoRoute(
      path: RouterNames.selectYourCoubtry,
      builder: (context, state) => const ChooseCountryView(),
    ),
    GoRoute(
      path: RouterNames.addCar,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: BlocProvider(
            create: (context) => AddCarCubit(),
            child: const AddCarView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
        );
      },
    ),

    GoRoute(
      path: RouterNames.congratulation,
      builder: (context, state) => const CongratulationView(),
    ),
    GoRoute(
      path: RouterNames.filterCar,
      builder: (context, state) => const FilterCarView(),
    ),

    // GoRoute(
    //   path: RouterNames.detailedGridPage,
    //   builder: (context, state) => const DetailedGridPage(),
    // ),
    GoRoute(
      path: RouterNames.carDetail,
      builder: (context, state) => const CarDetailScreen(),
    ),
    GoRoute(
      path: RouterNames.myAds,
      builder: (context, state) => const MyAdsView(),
    ),
    GoRoute(
      path: RouterNames.registerWithEmail,
      builder: (context, state) => const RegisterWithEmailView(),
    ),
  ],
);
