import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/data/cached/cache_helper.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/auth/presentation/view/choose_country_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/create_account_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_email_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/register/register_with_phone_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/verification_view.dart';
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
      path: RouterNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RouterNames.home,
      builder: (context, state) => const HomeView(),
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
  ],
);
