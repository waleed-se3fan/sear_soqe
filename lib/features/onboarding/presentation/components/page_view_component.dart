import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewComponent extends StatefulWidget {
  const PageViewComponent({super.key});

  @override
  State<PageViewComponent> createState() => _PageViewComponentState();
}

class _PageViewComponentState extends State<PageViewComponent> {
  final _controller = PageController();
  int _index = 0;

  Color get _primary => const Color(0xFF4C4AE6);

  final List<String> _images = const [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,

              onPageChanged: (i) => setState(() => _index = i),
              itemCount: _images.length,
              itemBuilder: (_, i) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Image.asset(
                  _images[i],
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (i) => Container(
                width: 8.w,
                height: 8.w,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: i == _index ? _primary : _primary.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
