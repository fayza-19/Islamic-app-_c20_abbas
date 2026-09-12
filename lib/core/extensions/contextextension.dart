
import 'package:flutter/material.dart';

extension Contextextension on BuildContext {
  double get getWidth => MediaQuery.sizeOf(this).width;
  double get getheight => MediaQuery.sizeOf(this).height;


}