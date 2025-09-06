import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_basic_info_card.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_title_and_pricee.dart';

class OverlappingCarDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -120,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
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
            // Car Title and Price
            CarTitleAndPrice(),
            
            SizedBox(height: 16),
            
            // Car Basic Info Cards
            CarBasicInfoCards(),
          ],
        ),
      ),
    );
  }
}

