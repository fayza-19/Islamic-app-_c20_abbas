import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';

class ThemeManager{
  static ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorsManager.gold
        ),
          backgroundColor: ColorsManager.black,
          foregroundColor: ColorsManager.gold,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsManager.gold)
      ),
      scaffoldBackgroundColor: ColorsManager.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.gold,
          selectedItemColor: ColorsManager.white,
          unselectedItemColor: ColorsManager.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed
      ),
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: ColorsManager.gold,
          labelStyle: TextStyle(color: ColorsManager.offwhite, fontSize: 16, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.gold, width: 1),
              borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.gold, width: 1),
              borderRadius: BorderRadius.circular(15)
          )
      ),
      textTheme: TextTheme(
          labelSmall: TextStyle(color: ColorsManager.black, fontWeight: FontWeight.bold, fontSize: 14),
          labelMedium: TextStyle(color: ColorsManager.black, fontWeight: FontWeight.w500, fontSize: 16),
          titleLarge: TextStyle(color: ColorsManager.black, fontWeight: FontWeight.bold, fontSize: 24),
        titleSmall: TextStyle(color: ColorsManager.offwhite, fontWeight: FontWeight.bold, fontSize: 14),

      )
  );
  static ThemeData dark = ThemeData(

  );

}