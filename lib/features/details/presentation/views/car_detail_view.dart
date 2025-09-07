import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/components/bottom_action_buttons.dart';
import 'package:sear_soqe/features/details/presentation/components/car_description_section.dart';
import 'package:sear_soqe/features/details/presentation/components/car_image_section.dart';
import 'package:sear_soqe/features/details/presentation/widgets/caredtails_section.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_devider.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarImageSection(),
                  SizedBox(height: 140),
                  CarDetailsSection(),      
                  CarDescriptionSection(),
                  CustomDivider()
                ],
              ),
            ),
          ),
    SizedBox(height: 10),
          
          BottomActionButtons(),
        ],
      ),
    );
  }
}

