import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/common/functions/validator.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/functions/show_toast.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:sear_soqe/features/auth/presentation/view/choose_country_view.dart';
import 'package:sear_soqe/features/auth/presentation/view/forget_password_view.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class LoginWithEmailComponent extends StatelessWidget {
  const LoginWithEmailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: context.read<AuthCubit>().formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'ادخل البريد الالكتروني',
              fillColor: AppColors.lightGrey,
              keyboardType: TextInputType.emailAddress,
              controller: context.read<AuthCubit>().emailController,
              validator: (value) {
                return Validator.validateEmail(value);
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              hintText: 'ادخل كلمة المرور',
              fillColor: AppColors.lightGrey,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              controller: context.read<AuthCubit>().passwordController,
              validator: (value) {
                return Validator.validatePassword(value);
              },
            ),
            SizedBox(height: 60.h),
            Row(
              children: [
                Text('لاتملك حساب ؟'),

                TextButton(
                  onPressed: () {
                    context.push(RouterNames.registerWithEmail);
                  },
                  child: Text(
                    'قم انشاء حساب',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SignInWithEmailAndPasswordError) {
                  showToast(message: state.message, state: ToastStates.ERROR);
                } else if (state is SignInWithEmailAndPasswordSuccess) {
                  showToast(message: state.message, state: ToastStates.SUCCESS);
                  context.go(RouterNames.selectYourCoubtry);
                }
              },
              builder: (context, state) {
                return CustomFooterWidget(
                  progress: 1,
                  trailing: Text('نسيت كلمه المرور'),
                  title: 'تسجيل الدخول',

                  onTapTrailing: () {
                    //  context.go(RouterNames.forgetPassword);
                  },
                  onTapTitle: () {
                    if (context
                        .read<AuthCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().signInWithEmailAndPassword(
                        context.read<AuthCubit>().emailController.text,
                        context.read<AuthCubit>().passwordController.text,
                      );
                    } else {
                      showToast(
                        message: 'الرجاء التحقق من البيانات',
                        state: ToastStates.ERROR,
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
