import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sear_soqe/features/add_car/presentation/view/my_ads_view.dart';
import 'package:sear_soqe/features/add_car/presentation/widgets/ads_states_row.dart';

class AdsCard extends StatelessWidget {
  const AdsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/image.png",
                  width: 90,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2,300,00 رس",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "آخر تحديث: 3/3/2025",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("بنزين"),
                          Text("2024"),
                          Text("0 كم"),
                        ],
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    SvgPicture.asset('assets/images/delete.svg'),
                    SizedBox(width: 18),
                    SvgPicture.asset('assets/images/update.svg'),
                  ],
                ),
              ],
            ),
            const Divider(),
            const AdsStatRow(),
          ],
        ),
      ),
    );
  }
}
