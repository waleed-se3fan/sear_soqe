import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/components/seller_info_card.dart';

class CarDescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'وصف:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'سيارة في حالة ممتازة، تم صيانتها دوريا، جميع الأوراق سارية المفعول. السيارة نظيفة جدا ومحافظ عليها. لا توجد أي أضرار أو خدوش. محرك قوي وناعم.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'اعرض المزيد',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            SellerInfoCard(
             
            )
          ],
        ),
      ),
    );
  }
}

