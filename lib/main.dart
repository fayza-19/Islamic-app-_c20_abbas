import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami20/core/routes_manager.dart';

import 'confg/theme/theme_manager.dart';

void main (){
  runApp(Islamiapp());
}
class Islamiapp extends StatelessWidget {
  const Islamiapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
      routes: RoutesManager.routes ,
      initialRoute: RoutesManager.onboarding,
    );
  }
}
