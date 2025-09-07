import 'package:flutter/material.dart';
import 'package:sear_soqe/features/add_car/presentation/widgets/state_item_widget.dart';

class AdsStatRow extends StatelessWidget {
  const AdsStatRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StatItem(icon: Icons.visibility, label: "34\nالمشاهدات"),
        StatItem(icon: Icons.phone, label: "34\nللكالات"),
        StatItem(icon: Icons.whatshot, label: "34\nواتساب"),
        StatItem(icon: Icons.message, label: "34\nرسالة"),
      ],
    );
  }
}
