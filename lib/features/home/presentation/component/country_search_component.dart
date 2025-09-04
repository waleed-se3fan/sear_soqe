import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountrySearchComponent extends StatefulWidget {
  const CountrySearchComponent({super.key});

  @override
  State<CountrySearchComponent> createState() => _CountrySearchComponentState();
}

class _CountrySearchComponentState extends State<CountrySearchComponent> {
  String _selectedCountry = 'SA';

  final Map<String, String> _countryFlags = const {
    'SA': 'assets/images/saudia.svg',
    'EG': 'assets/images/egypt.svg',
    'QA': 'assets/images/qatar.svg',
    'BH': 'assets/images/bahreen.svg',
    'AE': 'assets/images/emirates.svg',
    'KW': 'assets/images/kwit.svg',
    'OM': 'assets/images/oman.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "مرحباً Mohamed Ahmed",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "إبحث عن السيارات في",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCountry,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  dropdownColor: const Color(0xFF6A1FBF),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _selectedCountry = value);
                  },
                  items: _countryFlags.entries.map((e) {
                    return DropdownMenuItem<String>(
                      value: e.key,
                      child: Row(
                        children: [
                          SvgPicture.asset(e.value, width: 20, height: 14),
                          const SizedBox(width: 6),
                          Text(
                            e.key,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
