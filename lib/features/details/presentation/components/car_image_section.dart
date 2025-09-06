import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_image_icons.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_image_widget.dart';
import 'package:sear_soqe/features/details/presentation/widgets/over_lapping_car_details_card.dart';

class CarImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Car Image
        CarImageWidget(),
        
        // Overlapping Icons on Image
        CarImageIcons(),
        
        // Overlapping Car Details Card
        OverlappingCarDetailsCard(),
      ],
    );
  }
}

