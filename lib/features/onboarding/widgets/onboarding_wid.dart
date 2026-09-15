import 'package:flutter/material.dart';
import 'package:islami20/core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../models/onboarding_content.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingPageWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.black,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(content.image),
          Text(
            content.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            content.description,
            style: const TextStyle(fontSize: 16, color: ColorsManager.offwhite),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}