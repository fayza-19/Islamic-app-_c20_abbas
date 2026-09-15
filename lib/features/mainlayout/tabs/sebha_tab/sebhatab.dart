import 'package:flutter/material.dart';
import 'package:islami20/features/mainlayout/tabs/sebha_tab/widgets/dhikritem.dart';
import 'package:islami20/features/mainlayout/tabs/sebha_tab/widgets/rotating%20sebha.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/colors_manager.dart';


class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _dhikrIndex = 0;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(ImageAssets.sebhaTabbg),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImageAssets.islamilogo),
            const SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: ColorsManager.white,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: _onTap,
              child: Center(
                child: RotatingSebha(
                  rotationTicks: _count,
                  dhikrText: dhikrList[_dhikrIndex].text,
                  count: _count,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _count = _count + 1;
      if (_count >= dhikrList[_dhikrIndex].target) {
        _count = 0;
        _dhikrIndex = _dhikrIndex + 1;
        if (_dhikrIndex >= dhikrList.length) {
          _dhikrIndex = 0;
        }
      }
    });
  }
}