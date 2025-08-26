import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/stop_view.dart';
import 'package:sear_soqe/splash_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sear_soqe/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<String> checkPaidStatus() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  DatabaseEvent event = await ref.child('paid').once();
  final data = event.snapshot.value;
  return data.toString();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: checkPaidStatus().asStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data == 'true'
                  ? const SplashScreen()
                  : const StopView();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        theme: ThemeData(
          fontFamily: 'IBMPlexSansArabic',
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
