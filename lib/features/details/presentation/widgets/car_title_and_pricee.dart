import 'package:flutter/material.dart';

class CarTitleAndPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تويوتا كامري 1.5 تربو GLX 2024',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 8),
        Text(
          '2,300,00 ريس',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[600],
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

