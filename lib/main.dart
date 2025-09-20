import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sear_soqe/core/data/cached/cache_helper.dart';
import 'package:sear_soqe/core/routes/app_routers.dart';
import 'package:sear_soqe/core/data/firebase/firestore_database_service.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sear_soqe/firebase_options.dart';
// Future<String> checkPaidStatus() async {
//   DatabaseReference ref = FirebaseDatabase.instance.ref();
//   DatabaseEvent event = await ref.child('paid').once();
//   final data = event.snapshot.value;
//   return data.toString();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.ensureInitialized();

  CacheHelper.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translation',
      fallbackLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: ThemeData(
          fontFamily: 'IBMPlexSansArabic',
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: (context, child) => child!,
      ),
    );
  }
}
