import 'package:flutter/material.dart';

class CustomFeatureItem extends StatelessWidget {
  const CustomFeatureItem({super.key, required this.feature});
  final String feature;
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          SizedBox(width: 8),
          Text(
            feature,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}