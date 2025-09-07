import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider( // الخط الفاصل
      color: Color(0xFFE0E0E0),
      thickness: 1, // سُمك الخط
      indent: 16,   // مسافة من البداية
      endIndent: 16, // مسافة من النهاية
    );
  }
}