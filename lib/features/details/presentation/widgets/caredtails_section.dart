import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/components/car_deatils_card.dart';
import 'package:sear_soqe/features/details/presentation/components/car_feature_section.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_button.dart';

class CarDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saved Memory Text
          
          SizedBox(height: 16),
          
          // Car Details Cards Section
          CarDetailsCards(),
          
          SizedBox(height: 16),
          
          // Features Section
          CarFeaturesSection(),
          
          SizedBox(height: 16),
          
          // Show All Specifications Button
          ShowAllSpecificationsButton(),
          
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
