import 'package:flutter/cupertino.dart';
import 'package:islami20/core/assets_manager.dart';

import '../../../models/onboarding_content.dart';
List<OnboardingContent> onboardingData = [
  OnboardingContent(
    image: ImageAssets.norhbbekom,
    title: 'Welcome to Islami App',
    description: 'We are very excited to have you in our community',
  ),
  OnboardingContent(
    image: ImageAssets.masged,
    title: 'Welcome to Islami Community',
    description: 'Join a community that shares your values',
  ),
  OnboardingContent(
    image: ImageAssets.quran,
    title: 'Reading the Quran',
    description: 'Read, and your Lord is the Most Generous',
  ),
  OnboardingContent(
    image: ImageAssets.doaa,
    title: 'Bearish',
    description: 'Praise the name of your Lord, the Most High',
  ),
  OnboardingContent(
    image: ImageAssets.radio,
    title: 'Holy Quran Radio',
    description: 'You can listen to the Holy Quran Radio through the application',
  ),
];