import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

class RegisterWithEmailComponent extends StatelessWidget {
  const RegisterWithEmailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: context.read<AuthCubit>().formKey,
        child: Column(
          
          children: [
            
            CustomTextFormField(
              validator: (value) {
                return Validator.validateEmail(value);
              },
              hintText: 'ادخل البريد الالكتروني',
              fillColor: AppColors.lightGrey,
              keyboardType: TextInputType.emailAddress,
              controller: context.read<AuthCubit>().emailController,
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              validator: (value) {
                return Validator.validatePassword(value);
              },
              hintText: 'ادخل كلمة المرور',
              fillColor: AppColors.lightGrey,
              keyboardType: TextInputType.emailAddress,
              isPassword: true,
              controller: context.read<AuthCubit>().passwordController,
            ),
            SizedBox(height: 20.h),
            Spacer(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is CreateUserWithEmailAndPasswordError) {
                  showToast(message: state.message, state: ToastStates.ERROR);
                } else if (state is CreateUserWithEmailAndPasswordSuccess) {
                  showToast(
                    message: 'تم التسجيل بنجاح',
                    state: ToastStates.SUCCESS,
                  );
                  context.go(RouterNames.selectYourCoubtry);
                }
              },
              builder: (context, state) {
                return state is CreateUserWithEmailAndPasswordLoading
                    ? CircularProgressIndicator()
                    : CustomFooterWidget(
                        progress: 0.6,
                        trailing: Icon(Icons.arrow_forward),
                        title: 'المتابعه',
                        onTapTitle: () {
                          if (context
                              .read<AuthCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<AuthCubit>()
                                .createUserWithEmailAndPassword(
                                  context
                                      .read<AuthCubit>()
                                      .emailController
                                      .text,
                                  context
                                      .read<AuthCubit>()
                                      .passwordController
                                      .text,
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
