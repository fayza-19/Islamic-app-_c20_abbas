import 'package:flutter/material.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/core/colors_manager.dart';
import 'package:islami20/core/constant_manager.dart';
import 'package:islami20/core/extensions/contextextension.dart';
import 'package:islami20/features/mainlayout/tabs/quran_tab/widgets/most_recent_card.dart';
import 'package:islami20/features/mainlayout/tabs/quran_tab/widgets/suraitem.dart';
import 'package:islami20/models/surah_model.dart';

class Qurantab extends StatelessWidget {
  const Qurantab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageAssets.quranTabbg))
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImageAssets.islamilogo),
            SizedBox(height: context.getheight * 0.02)
            ,TextField(
              style: TextStyle(color: ColorsManager.offwhite ,fontSize: 16),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.gold , width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide( color: ColorsManager.gold , width: 2)
                ),
                hintText: "sura name",
                hintStyle: TextStyle(color: ColorsManager.offwhite , fontSize: 16 , fontWeight: FontWeight.w500) ,
                prefixIcon: ImageIcon(AssetImage(IconAssets.quran)),
                prefixIconColor: ColorsManager.gold
              ),
            ),
            SizedBox(height: context.getheight * 0.02),
            Text("Most recently" , style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10,),
           SizedBox(
             height: context.getheight *0.17,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               separatorBuilder: (context, index) => SizedBox(width: 5,) ,
                 itemBuilder: (context , index)=> MostRecentCard() ,
               itemCount: 10 ,),
           ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context , index)=>Suraitem(sura: SuraModel.suras[index])
                ,
                separatorBuilder: (context , index)=> Container(
                  margin : EdgeInsets.symmetric(vertical: 10 , horizontal: 20 ),
                  width: double.infinity,
                  height: 2,
                  color: ColorsManager.offwhite,
                ),
                itemCount: 114)


          ],
        ),
      ),
    );
  }
}
