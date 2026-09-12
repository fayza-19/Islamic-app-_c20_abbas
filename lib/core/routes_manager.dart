import 'package:flutter/material.dart';
import 'package:islami20/features/mainlayout/main_layout.dart';

abstract class RoutesManager {
  static const String mainlayout = "/mainlayout";
   static  Map<String , WidgetBuilder> routes ={
    mainlayout : (context) => MainLayout()
  };
}