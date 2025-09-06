import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_feature_item.dart';

class CarFeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المواصفات:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        CustomFeatureItem( feature: 'ABS',),
        CustomFeatureItem( feature: 'وسائد هواء',),
        CustomFeatureItem( feature: 'نوافذ كهربائية',),
        CustomFeatureItem( feature: 'تحكم في المناخ',),
      ],
    );
  }


}

