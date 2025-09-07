import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Positioned(
            left: 280,
            top: 140,
            child:
           Container(
  height: 27.h,
  width: 50.h,
  decoration: BoxDecoration(
    color: Color(0xFF4044C9),
    borderRadius: BorderRadius.circular(6), // لو عايز زوايا مدورة
  ),
  child: Center(
    child: Text(
      "مميز",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      ),
    ),
  ),
)

          )
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

