import 'package:flutter/material.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_detailed_card.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_devider.dart';
import 'package:go_router/go_router.dart';
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
            Expanded(child: CustomDetailedCard(title: '12+ المزيد',color: Colors.blue,onTap: (){
              GoRouter.of(context).push(RouterNames.detailedGridPage);
            }, )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.camera_alt, title: 'أوتوماتيك', )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.color_lens, title: 'اللون', )),
            SizedBox(width: 12),
            Expanded(child: CustomDetailedCard(icon: Icons.location_on, title: 'الموقع', )),
          ],
        ),
        SizedBox(height: 12),
        CustomDivider(),
      ],
    );
  }

  
}

