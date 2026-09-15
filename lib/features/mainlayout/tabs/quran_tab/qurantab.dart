import 'package:flutter/material.dart';
import 'package:islami20/core/extensions/contextextension.dart';
import 'package:islami20/features/mainlayout/tabs/quran_tab/widgets/most_recent_list.dart';
import 'package:islami20/features/mainlayout/tabs/quran_tab/widgets/suraitem.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/colors_manager.dart';
import '../../../../models/surah_model.dart';

class Qurantab extends StatefulWidget {
  const Qurantab({super.key});

  @override
  State<Qurantab> createState() => QuranState();
}

class QuranState extends State<Qurantab> {
  List<SuraModel> filteredList = SuraModel.suras;

  @override
  Widget build(BuildContext context) {
    print("Entering quran tab build nwww");

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageAssets.quranTabbg)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImageAssets.islamilogo),
            SizedBox(height: context.getheight * 0.02),
            TextField(
              onChanged: (input){
                showFilteredList(input);
              },
              cursorColor: ColorsManager.offwhite,
              style: TextStyle(color: ColorsManager.offwhite, fontSize: 18),
              decoration: InputDecoration(
                labelText: "Sura name",
                prefixIcon: ImageIcon(AssetImage(IconAssets.quran)),
              ),
            ),
            SizedBox(height: context.getheight * 0.02),

            MostRecentList(refreshQuranTab: refreshQuranTab,),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index)=>SuraItem(
                  sura: filteredList[index],
                  refreshQuranTab: refreshQuranTab,


                ),
                separatorBuilder: (context, index)=>Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  height: 2,
                  color: ColorsManager.offwhite,
                ),
                itemCount:filteredList.length
            )

          ],
        ),
      ),
    );
  }


  void refreshQuranTab(){
    setState(() {

    });
  }

  void showFilteredList(String input) {
    if(input.isEmpty){

      filteredList = SuraModel.suras;
    }else{
      filteredList = SuraModel.suras.where((sura)=> sura.suraNameEn.toLowerCase().contains(input.toLowerCase()) || sura.suraNameAr.contains(input)).toList();
    }

    setState(() {

    });
  }
}