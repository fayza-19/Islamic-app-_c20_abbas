import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami20/core/assets_manager.dart';
import 'package:islami20/core/colors_manager.dart';
import 'package:islami20/models/surah_model.dart';
class SuraDetails extends StatefulWidget {
  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}
class _SuraDetailsState extends State<SuraDetails> {
  late SuraModel sura ;
@override
  void didChangeDependencies() {
  super.didChangeDependencies();
   sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
  loadsura(sura.suraIndex);
  }
List<String> verses = [];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.suraNameEn),

      ),
      body: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageAssets.leftcorner)
            ,Text(sura.suraNameAr , style: TextStyle(color: ColorsManager.gold ,fontSize: 24 , fontWeight: FontWeight.bold),)
            ,Image.asset(ImageAssets.rightcorner),

          ],
                      ),
          Expanded(flex: 10,
              child: verses.isEmpty ?
          Center(child: CircularProgressIndicator(color: ColorsManager.offwhite,),)
              : ListView.builder(itemBuilder: (context, index)=> Text(verses[index] ,textDirection: TextDirection.rtl, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: ColorsManager.gold),)
              , itemCount: verses.length)
          )
          ,Spacer(),
          Image.asset(ImageAssets.bottomdecoration)
        ],
      ),
    );
  }

  void loadsura (String index) async{
    String key= 'assets/files/suras/${index}.txt';
    String filecontent = await rootBundle.loadString(key);
    List<String> suralines =  filecontent.trim().split('\n');
    for (int i = 0 ; i < suralines.length ; i ++){
      suralines[i] += "[${i+1}]";

    }
    verses = suralines ;
    await Future.delayed(Duration(seconds:1));
    setState(() {});
  }
}
