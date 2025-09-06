import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerInfoCard extends StatelessWidget {


  const SellerInfoCard({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'معلومات البائع',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: SvgPicture.asset('assets/images/logo.svg', width: 60, height: 60),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 16),
              // بيانات البائع
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم حساب البائع',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                          Icon(Icons.location_on_outlined, size: 16, ),
                          const SizedBox(width: 5),
                        const Text(
                         'الموقع الخاص به ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // زر العرض
             
            ],
          ),
          const SizedBox(height: 23),
          Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'اعرض حساب البائع واعلاناتة الخاصة',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  ),
);
  }
}
