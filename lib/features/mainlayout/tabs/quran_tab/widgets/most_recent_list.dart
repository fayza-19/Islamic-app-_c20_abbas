import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami20/core/extensions/contextextension.dart';
import '../../../../../core/extensions/prefs.dart';
import '../../../../../models/surah_model.dart';
import 'most_recent_item.dart';

class MostRecentList extends StatefulWidget {
  MostRecentList({super.key, required this.refreshQuranTab});
  void Function() refreshQuranTab;
  @override
  State<MostRecentList> createState() => MostRecentListState();
}

class MostRecentListState extends State<MostRecentList> {
  List<SuraModel> mostRecentSuras = [];

  void fillMostRecentSuras()async{
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    fillMostRecentSuras();
  }
  @override
  void didUpdateWidget(covariant MostRecentList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    fillMostRecentSuras();
  }



  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isNotEmpty,
      child: SizedBox(
        height: context.getheight * 0.17,

        child: Column(
          children: [
            Text("Most Recently", style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 5),
                itemBuilder: (context, index) =>
                    MostRecentItem(sura: mostRecentSuras[index], refreshQuranTab: widget.refreshQuranTab,),
                itemCount: mostRecentSuras.length,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}