import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_detailed_card.dart';

class CarBasicInfoCards extends StatelessWidget {
  const CarBasicInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDetailedCard(icon: Icons.settings, title: 'اوتوماتيك', )),
        SizedBox(width: 8),
        Expanded(child: CustomDetailedCard( icon: Icons.local_gas_station, title: 'بنزين',)),
        SizedBox(width: 8),
        Expanded(child: CustomDetailedCard(  icon: Icons.speed, title: '54,555 كم',)),
        SizedBox(width: 8),
        Expanded(child: CustomDetailedCard( icon: Icons.calendar_today, title: '2019',)),
      ],
    );
  }

}

