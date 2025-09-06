import 'package:flutter/material.dart';
import 'package:sear_soqe/features/auth/presentation/components/login/login_with_email_component.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_header_widget.dart';

class LoginWithEmailView extends StatelessWidget {
  const LoginWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              CustomAuthHeaderWidget(title: 'تسجيل الدخول بالبريد الالكتروني'),
              SizedBox(height: 20),
              LoginWithEmailComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
