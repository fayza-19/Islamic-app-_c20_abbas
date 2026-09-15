import 'package:flutter/material.dart';
import 'package:islami20/models/surah_model.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/colors_manager.dart';
import '../../../../../core/extensions/prefs.dart';
import '../../../../../core/routes_manager.dart';

class MostRecentItem extends StatelessWidget {
  MostRecentItem({super.key, required this.sura, required this.refreshQuranTab});
  SuraModel sura;
  void Function() refreshQuranTab;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: ()async{
        PrefsManager.saveSuraIndex(sura.suraIndex);
        await Navigator.pushNamed(context, RoutesManager.suradetails,arguments: sura);
        refreshQuranTab();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sura.suraNameEn, style: Theme.of(context).textTheme.labelLarge,),
                Text(sura.suraNameAr,style: Theme.of(context).textTheme.labelLarge,),
                Text("${sura.versesNum}",style: Theme.of(context).textTheme.labelSmall,),
              ],
            ),
            Image.asset(ImageAssets.mostrecentcardwidget)
          ],
        ),
      ),
    );
  }
}