import 'package:flutter/material.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/features/onboarding/widgets/onboarding_wid.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/colors_manager.dart';
import '../../core/routes_manager.dart';
import 'onboarding_data/data.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goToNextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _goToPreviousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, RoutesManager.mainlayout);  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(ImageAssets.islamilogo),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(content: onboardingData[index]);
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: onboardingData.length,
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.amber,
                dotColor: Colors.white24,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex > 0
                      ? TextButton(
                    onPressed: _goToPreviousPage,
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                      : const SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: _goToNextPage,
                    child: Text(
                      _currentIndex == onboardingData.length - 1
                          ? 'Finish'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}