import 'package:flutter/material.dart';
import 'package:sear_soqe/features/details/presentation/widgets/custom_feature_item.dart';
// استبدل بالمسار الصحيح

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      'ABS',
      'وسائد هواء',
      'نوافذ كهربائية',
      'تحكم في المناخ',
      'بلوتوث',
      'نظام ملاحة',
      'كاميرا خلفية',
      'حساسات ركن',
      'مثبت سرعة',
      'فرش جلد',
      'مقاعد كهربائية',
      'فتحة سقف',
      'نظام صوت ممتاز',
      'عجلات ألمنيوم',
      'إضاءة LED',
      'دخول بدون مفتاح',
      'تشغيل بزر',
      'مرايا كهربائية',
      'نظام تثبيت المقعد للأطفال ISOFIX',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Column(
        children: [ const Text(
              ' ما المواصفات التى تمتلكها هذه السيارة  ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: features.length,
              itemBuilder: (context, index) {
                return CustomFeatureItem(
                  feature: features[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
