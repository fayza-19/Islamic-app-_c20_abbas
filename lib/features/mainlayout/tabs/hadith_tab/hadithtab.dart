import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/core/colors_manager.dart';
import 'package:islami20/features/mainlayout/tabs/hadith_tab/widgets/hadithitem.dart';

class Hadithtab extends StatelessWidget {
  const Hadithtab({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
              image: AssetImage(ImageAssets.hadithTabbg))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageAssets.islamilogo),
          CarouselSlider(
            options: CarouselOptions(
                height: 600.0 ,
            viewportFraction: 0.8,
              enlargeFactor: 0.2,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,

            ),
            items: List.generate(50, (index)=>index+1).map((index) {
              return Hadithitem(index: index);
            }).toList(),
          )
        ],
      ),
    );
  }

}
