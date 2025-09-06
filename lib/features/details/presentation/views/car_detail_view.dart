import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car Image Section with overlapping details
                    CarImageSection(),
                    
                    SizedBox(height: 120),
                    
                    // Car Details and Features Section
                    CarDetailsSection(),
                    
                    // Car Description Section
                    CarDescriptionSection(),
                  ],
                ),
              ),
            ),
            
            // Bottom Action Buttons
            BottomActionButtons(),
          ],
        ),
      ),
    );
  }
}

// 1. قسم صورة السيارة مع الأيقونات والتفاصيل المتداخلة
class CarImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Car Image
        CarImageWidget(),
        
        // Overlapping Icons on Image
        CarImageIcons(),
        
        // Overlapping Car Details Card
        OverlappingCarDetailsCard(),
      ],
    );
  }
}

// 2. ويدجت صورة السيارة
class CarImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// 3. الأيقونات المتداخلة على الصورة
class CarImageIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildCircleIcon(Icons.favorite_border, () {}),
          Positioned(
            left: 45,
            top: 0,
            child: _buildCircleIcon(Icons.share, () {}),
          ),
          Positioned(
            left: 290,
            top: 0,
            child: _buildCircleIcon(Icons.arrow_back_ios_new, () {}),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 20),
      ),
    );
  }
}

// 4. كارت تفاصيل السيارة المتداخل
class OverlappingCarDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -120,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Title and Price
            CarTitleAndPrice(),
            
            SizedBox(height: 16),
            
            // Car Basic Info Cards
            CarBasicInfoCards(),
          ],
        ),
      ),
    );
  }
}

// 5. عنوان السيارة والسعر
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

// 6. كاردات المعلومات الأساسية
class CarBasicInfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildInfoCard(Icons.settings, 'اوتوماتيك', 'ناقل الحركة')),
        SizedBox(width: 8),
        Expanded(child: _buildInfoCard(Icons.local_gas_station, 'بنزين', 'نوع الوقود')),
        SizedBox(width: 8),
        Expanded(child: _buildInfoCard(Icons.speed, '54,555 كم', '')),
        SizedBox(width: 8),
        Expanded(child: _buildInfoCard(Icons.calendar_today, '2019', 'سنة الصنع')),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 8,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

// 7. قسم تفاصيل السيارة والمواصفات
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
          SavedMemoryText(),
          
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

// 8. نص الذاكرة المحفوظة
class SavedMemoryText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'الذاكرة المحفوظة',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[600],
      ),
    );
  }
}

// 9. كاردات تفاصيل السيارة
class CarDetailsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تفاصيل السيارة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: 12),
        
        Row(
          children: [
            Expanded(child: _buildDetailCard(Icons.add, '12+ المزيد', '')),
            SizedBox(width: 12),
            Expanded(child: _buildDetailCard(Icons.camera_alt, 'أوتوماتيك', '')),
            SizedBox(width: 12),
            Expanded(child: _buildDetailCard(Icons.color_lens, 'اللون', 'بيروز')),
            SizedBox(width: 12),
            Expanded(child: _buildDetailCard(Icons.location_on, 'الموقع', 'القاهرة')),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailCard(IconData icon, String title, String subtitle) {
    return Container(
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
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

// 10. قسم المواصفات
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
        _buildFeatureItem('ABS'),
        _buildFeatureItem('وسائد هواء'),
        _buildFeatureItem('نوافذ كهربائية'),
        _buildFeatureItem('تحكم في المناخ'),
      ],
    );
  }

  Widget _buildFeatureItem(String feature) {
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

// 11. زر عرض جميع المواصفات
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

// 12. قسم وصف السيارة
class CarDescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'وصف:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'سيارة في حالة ممتازة، تم صيانتها دوريا، جميع الأوراق سارية المفعول. السيارة نظيفة جدا ومحافظ عليها. لا توجد أي أضرار أو خدوش. محرك قوي وناعم.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'اعرض المزيد',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            SellerInfoCard(
             
            )
          ],
        ),
      ),
    );
  }
}

// 14. أزرار العمل السفلية
class BottomActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
               
              },
              label: Text('رسالة', style: TextStyle(color: Color(0xFF4044C9))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text('اتصال', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4044C9),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset('assets/images/ic_round-whatsapp.png'),
              label: Text('', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF25D367),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


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
