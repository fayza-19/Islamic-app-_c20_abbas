import 'package:flutter/material.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/core/colors_manager.dart';
import 'package:islami20/models/surah_model.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.suraNameEn),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Stack(
              alignment: Alignment.center ,
              children:[
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.leftcorner)
                  ,Image.asset(ImageAssets.rightcorner),

                ],

              ),]
            ),
          ),
          Spacer(),
          Image.asset(ImageAssets.bottomdecoration)
        ],
      ),
    );
  }
}
