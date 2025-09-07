import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_basic_info_card.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_title_and_pricee.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_devider.dart';

class OverlappingCarDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -165,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarTitleAndPrice(),
            
            
            CarBasicInfoCards(),
            CustomDivider()
          ],
        ),
      ),
    );
  }
}

