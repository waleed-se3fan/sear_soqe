import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topRight, child: Text('الماركه')),
            SizedBox(height: 4.h),
            Image.asset('assets/images/car_category.png'),
          ],
        ),
      ),
    );
  }
}
