import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_image_icons.dart';
import 'package:sear_soqe/features/details/presentation/widgets/car_image_widget.dart';
import 'package:sear_soqe/features/details/presentation/widgets/over_lapping_car_details_card.dart';

class CarImageSection extends StatelessWidget {
  const CarImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarImageWidget(),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Row(
            children: [
              buildCircleIcon(Icons.arrow_back_ios_new, () {
                Navigator.pop(context);
              }),
              Spacer(),
              buildCircleIcon(Icons.favorite_border, () {}),
              SizedBox(width: 16),
              buildCircleIcon(Icons.share, () {}),
            ],
          ),
        ),
        // CarImageIcons(),
        OverlappingCarDetailsCard(),
      ],
    );
  }
}

Widget buildCircleIcon(IconData icon, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.black, size: 20),
    ),
  );
}
