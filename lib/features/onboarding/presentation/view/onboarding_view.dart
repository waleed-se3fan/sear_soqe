import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/features/onboarding/presentation/widgets/actions_widget.dart';
import 'package:sear_soqe/features/onboarding/presentation/widgets/header_widget.dart';
import 'package:sear_soqe/features/onboarding/presentation/components/page_view_component.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              HeaderWidget(),
              SizedBox(height: 8.h),
              PageViewComponent(),
              SizedBox(height: 15.h),
              ActionsWidget(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
