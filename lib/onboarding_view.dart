import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> s = [
      PageViewModel(body: 'ssasas'),
      PageViewModel(body: 'ssasas'),
      PageViewModel(body: 'ssasas'),
    ];
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          Text('هناك حقيقه مثبته منذ زمن طويل'),
          Text(
            'هناك حقيقه مثبته من زمن طويل وهي ان المحتوي المقروء لصفخة ما سيلهي القارئ عن التركيز علي الشكل الخارجي للنص',
          ),

          IntroductionScreen(
            pages: s,
            showNextButton: false,
            done: const Text("Done"),
            onDone: () {
              // On button pressed
            },
          ),
          SizedBox(
            height: 100,
            width: 500,
            child: PageView.builder(
              itemBuilder: (c, a) {
                return Image.asset('assets/images/onboarding3.png');
              },
            ),
          ),
        ],
      ),
    );
  }
}
