import 'package:flutter/material.dart';

class ShowAllSpecificationsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'اعرض الكل 19 المواصفات',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
