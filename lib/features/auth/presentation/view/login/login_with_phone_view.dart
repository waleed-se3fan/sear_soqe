import 'package:flutter/material.dart';
import 'package:sear_soqe/features/auth/presentation/components/login/login_with_phone_component.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';

class LoginWithPhoneView extends StatelessWidget {
  const LoginWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              CustomAuthHeaderWidget(title: 'تسجيل الدخول بالرقم'),
              SizedBox(height: 20),
              LoginWithPhoneComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
