import 'package:flutter/material.dart';

class CustomDetailedCard extends StatelessWidget {
  const CustomDetailedCard({
    super.key,
     this.icon,
    required this.title, this.onTap, this.color,
  });

  final IconData? icon;
  final Color? color;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color ?? Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          
          
        ],
      ),
    )
    );

  }
}