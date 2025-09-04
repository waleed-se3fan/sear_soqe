import 'package:flutter/material.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/core/utils/app_styles.dart';

class PopularWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String price;
  final String city;
  final String year;
  final String fuel;
  final String km;

  const PopularWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.price,
    required this.city,
    required this.year,
    required this.fuel,
    required this.km,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image with date overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(date, style: AppStyles.ts12GreyW400),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: AppStyles.ts14BlackW500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(price, style: AppStyles.ts14BlueW500),
          ),

          const SizedBox(height: 6),

          /// Info Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoItem(Icons.location_on_outlined, city),
                _infoItem(Icons.speed, km),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoItem(Icons.calendar_month, year),
                _infoItem(Icons.local_gas_station, fuel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: AppColors.grey),
        const SizedBox(width: 4),
        Text(text, style: AppStyles.ts12BlackW400),
      ],
    );
  }
}
