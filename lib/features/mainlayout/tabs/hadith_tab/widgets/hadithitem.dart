import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami20/models/hadith_model.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/colors_manager.dart';

class Hadithitem extends StatefulWidget {
  Hadithitem({super.key , required this.index});
int index;
  @override
  State<Hadithitem> createState() => _HadithitemState();
}

class _HadithitemState extends State<Hadithitem> {
  HadithModel ? hadith;
@override
  void initState() {
    super.initState();
    loadhadith(widget.index);
}
  @override
  Widget build(BuildContext context) {

  return Container(
      padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 8),

      decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(24)
      ),child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageAssets.leftcorner , color: ColorsManager.black,),

            Image.asset(ImageAssets.rightcorner, color: ColorsManager.black),
          ],
                ),
          Text(hadith?.title ?? '',textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorsManager.black),)
          ],
        ),
        Expanded(child: hadith == null ? Center(child: CircularProgressIndicator(color: ColorsManager.offwhite,),) :
        SingleChildScrollView(child: Text(hadith!.content,textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorsManager.black),)))


      ],),
    );
  }
  void loadhadith(int index) async{
    String key = 'assets/files/hadeeth/h${index}.txt';
    String hadithContent = await rootBundle.loadString(key);
    List<String> hadithlines = hadithContent.split("\n");
    String title = hadithlines[0];
    hadithlines.removeAt(0);
    String content = hadithlines.join();
    hadith = HadithModel(title: title, content: content);
    await Future.delayed(Duration(seconds:1));

    setState(() {

    });
  }

}
