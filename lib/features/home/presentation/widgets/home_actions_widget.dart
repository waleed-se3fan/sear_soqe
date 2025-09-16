import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/home/presentation/widgets/home_option_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeActionsWidget extends StatelessWidget {
  const HomeActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HomeOptionWidget(
              image: 'assets/images/my_car.png',
              title: 'شراء سيارة',
            ),

            HomeOptionWidget(
              image: 'assets/images/car-key.png',
              title: 'بيع سيارة',
              onTap: () {
                context.go(RouterNames.addCar);
              },
            ),
          ],
        ),

        Row(
          children: [
            HomeOptionWidget(
              image: 'assets/images/compass.png',
              title: 'دليل السياره',
            ),
            HomeOptionWidget(
              image: 'assets/images/newspaper.png',
              title: 'اخبار السيارات',
            ),
          ],
        ),
      ],
    );
  }
}
