import 'package:flutter/material.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/core/colors_manager.dart';
import 'package:islami20/features/mainlayout/tabs/hadith_tab/hadithtab.dart';
import 'package:islami20/features/mainlayout/tabs/quran_tab/qurantab.dart';
import 'package:islami20/features/mainlayout/tabs/radio_tab/radiotab.dart';
import 'package:islami20/features/mainlayout/tabs/time_tab/timetab.dart';

import 'tabs/sebha_tab/sebhatab.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    Qurantab(),
   Hadithtab(),
  Sebhatab(),
  Timetab(),
  Radiotab()

  ];

  int selectedindex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: ColorsManager.black,
      body: tabs[selectedindex],
      bottomNavigationBar:_buildbottomnavigationbar,
    );
  }
  void _ontab(int tappedIndex){
    setState(() {
      selectedindex = tappedIndex;
    });
  }
  Widget get _buildbottomnavigationbar{
    return BottomNavigationBar(
        currentIndex: selectedindex,
        onTap:_ontab ,
        backgroundColor: ColorsManager.gold,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: buildicon(icon: IconAssets.quran , isselected: selectedindex ==0), label: "Quran"),
          BottomNavigationBarItem(icon: buildicon(icon: IconAssets.hadith , isselected: selectedindex ==1), label: "Hadith"),
          BottomNavigationBarItem(icon: buildicon(icon: IconAssets.sebha , isselected: selectedindex ==2), label: "Sebha"),
          BottomNavigationBarItem(icon: buildicon(icon: IconAssets.radio , isselected: selectedindex ==3), label: "Radio"),
          BottomNavigationBarItem(icon: buildicon(icon: IconAssets.time , isselected: selectedindex ==4), label: "Time"),


        ]);
  }
  Widget buildicon({ required bool isselected,required String icon}){
    return isselected ? Container(
      padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 20),
      decoration: BoxDecoration(
        color: ColorsManager.black.withOpacity(0.5)
,borderRadius: BorderRadius.circular(66))
          ,child:ImageIcon(AssetImage(icon)) ,
    ) : ImageIcon(AssetImage(icon));
  }
}
