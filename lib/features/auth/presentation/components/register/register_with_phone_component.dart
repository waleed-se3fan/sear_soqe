import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/data/firebase/firestore_database_service.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/features/auth/presentation/widgets/custom_footer_widget.dart';

Future<void> verifyPhoneNumber(context) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+201004501339',
    verificationCompleted: (PhoneAuthCredential credential) async {
      // إذا تم التحقق بنجاح
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      print("تم التسجيل بنجاح: ${userCredential.user!.phoneNumber}");
    },
    verificationFailed: (FirebaseAuthException e) {
      // في حالة الفشل
      print("فشل التحقق: ${e.message}");
    },
    codeSent: (String verificationId, int? resendToken) {
      // عند إرسال رمز التحقق
      showDialog(
        context: context,
        builder: (context) {
          String smsCode = "";
          return AlertDialog(
            title: Text("أدخل رمز التحقق"),
            content: TextField(
              onChanged: (value) {
                smsCode = value;
              },
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  // إنشاء credential باستخدام رمز التحقق
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: smsCode,
                  );
                  // التحقق من الرمز
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithCredential(credential);
                  print(
                    "تم التسجيل بنجاح: ${userCredential.user!.phoneNumber}",
                  );
                  Navigator.of(context).pop();
                },
                child: Text("تأكيد"),
              ),
            ],
          );
        },
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // عند انتهاء وقت التحقق التلقائي
      print("انتهى الوقت");
    },
  );
}

class RegisterWithPhoneComponent extends StatelessWidget {
  const RegisterWithPhoneComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            suffixIcon: InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  countryListTheme: CountryListThemeData(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  onSelect: (Country value) {
                    print(value.phoneCode);
                  },
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/saudia.svg', height: 24.h),
                  SizedBox(width: 8.w),

                  Text('(+996)'),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down_sharp),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.phone,
            readOnly: true,
          ),

          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: '01029673915',
            fillColor: AppColors.lightGrey,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20.h),
          Spacer(),
          CustomFooterWidget(
            onTapTitle: () async {
              verifyPhoneNumber(context);
            },
            progress: 0.3,
            title: 'المتابعه',
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
