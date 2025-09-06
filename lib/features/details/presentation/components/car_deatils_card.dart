import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_detailed_card.dart';

class CarDetailsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تفاصيل السيارة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: 12),
        
        Row(
          children: [
            Expanded(child: CustomDetailedCard(icon: Icons.add, title: '12+ المزيد',color: Colors.blue,onTap: (){}, )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.camera_alt, title: 'أوتوماتيك', )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.color_lens, title: 'اللون', )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.location_on, title: 'الموقع', )),
          ],
        ),
      ],
    );
  }

  
}

