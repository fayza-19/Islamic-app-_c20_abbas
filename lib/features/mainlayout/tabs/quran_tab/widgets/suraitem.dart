import 'package:flutter/material.dart';
import '../../../../../core/assets_manager.dart';
import '../../../../../core/colors_manager.dart';
import '../../../../../core/extensions/prefs.dart';
import '../../../../../core/routes_manager.dart';
import '../../../../../models/surah_model.dart';

class SuraItem extends StatelessWidget {
  SuraItem({super.key, required this.sura, required this.refreshQuranTab});
  SuraModel sura;
  void Function() refreshQuranTab;

  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: ()async{
        PrefsManager.saveSuraIndex(sura.suraIndex);
        await  Navigator.pushNamed(
          context,
          RoutesManager.suradetails,
          arguments: sura,
        );
        refreshQuranTab();
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageAssets.suranumberframe),
              Text(sura.suraIndex, style: TextStyle(fontSize: 16,color: ColorsManager.offwhite, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(width: 8,),
          Column(
            children: [
              Text(sura.suraNameEn, style: Theme.of(context).textTheme.titleSmall),
              Text(sura.versesNum, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          Spacer(),
          Text(sura.suraNameAr, style: Theme.of(context).textTheme.titleSmall),




        ],
      ),
    );
  }
}
