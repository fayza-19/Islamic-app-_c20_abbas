import 'package:flutter/material.dart';
import 'package:islami20/core/routes_manager.dart';
import 'package:islami20/models/surah_model.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/colors_manager.dart';

class Suraitem extends StatelessWidget {
   Suraitem({super.key , required this.sura });
   SuraModel sura ;




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,
            RoutesManager.suradetails,
        arguments: sura,);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [

              Image.asset(ImageAssets.suranumberframe),
              Text(sura.suraIndex , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500, color:ColorsManager.offwhite),),
            ],
          ),
          Column(
            children: [
              Text(sura.suraNameEn , style: Theme.of(context).textTheme.titleSmall),
              Text(sura.versesNum , style: Theme.of(context).textTheme.titleSmall),

            ],
          ),
          Spacer()
          ,Text(sura.suraNameAr , style: Theme.of(context).textTheme.titleSmall),

        ],
      ),
    );
  }
}
