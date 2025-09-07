import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_detailed_card.dart';

class DetailedGridPage extends StatelessWidget {
  const DetailedGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.calendar_today, "title": "2019", "color": Colors.black},
      {"icon": Icons.speed, "title": "54,555 كم", "color": Colors.black},
      {"icon": Icons.local_gas_station, "title": "بنزين", "color": Colors.black},
      {"icon": Icons.meeting_room, "title": "4 أبواب", "color": Colors.black},
      {"icon": Icons.location_on, "title": "أبو ظبي", "color": Colors.black},
      {"icon": Icons.settings, "title": "أوتوماتيك", "color": Colors.black},
      {"icon": Icons.report, "title": "خالية من الحوادث", "color": Colors.black},
      {"icon": Icons.color_lens, "title": "أحمر", "color": Colors.black},
      {"icon": Icons.circle, "title": "4 أسطوانات", "color": Colors.black},
      {"icon": Icons.local_car_wash, "title": "1500", "color": Colors.black},
      {"icon": Icons.store, "title": "بعد الفحص: نعم", "color": Colors.black},
      {"icon": Icons.build, "title": "بعد الصيانة: نعم", "color": Colors.black},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            const Text(
              ' جميع معلومات السيارة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),

            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 أعمدة
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CustomDetailedCard(
                    icon: item["icon"] as IconData,
                    title: item["title"] as String,
                    color: item["color"] as Color,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("ضغطت على ${item["title"]}")),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
