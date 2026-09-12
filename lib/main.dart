import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami20/core/routes_manager.dart';

void main (){
  runApp(Islamiapp());
}
class Islamiapp extends StatelessWidget {
  const Islamiapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes ,
      initialRoute: RoutesManager.mainlayout,
    );
  }
}
