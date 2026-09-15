import 'package:flutter/material.dart';
import 'package:islami20/features/mainlayout/main_layout.dart';
import 'package:islami20/features/onboarding/onboardingtap.dart';
import 'package:islami20/features/quran_features/sura_details.dart';

abstract class RoutesManager {
  static const String mainlayout = "/mainlayout";
  static const String suradetails = "/suradetails";
  static const String onboarding = "/onboarding";

  static  Map<String , WidgetBuilder> routes ={
    mainlayout : (context) => MainLayout(),
    suradetails : (context) => SuraDetails(),
    onboarding : (context) => OnboardingScreen(),


  };
}