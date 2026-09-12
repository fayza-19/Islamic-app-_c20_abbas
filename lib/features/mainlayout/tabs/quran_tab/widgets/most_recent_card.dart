import 'package:flutter/material.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/colors_manager.dart';

class MostRecentCard extends StatelessWidget {
  const MostRecentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 17),
      decoration: BoxDecoration(
          color:ColorsManager.gold,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column( children: [
            Text("Al-fatiha" , style:Theme.of(context).textTheme.titleLarge),
            Text("الفاتحه" , style: Theme.of(context).textTheme.labelMedium),
            Text("122", style: Theme.of(context).textTheme.labelSmall,),
          ]) ,
          Image.asset(ImageAssets.mostrecentcardwidget)

        ],
      ),
    );
  }
}
