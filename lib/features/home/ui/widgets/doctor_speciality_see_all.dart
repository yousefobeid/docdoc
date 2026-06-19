import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  final String text;
  final String subText;
  const DoctorSpecialitySeeAll({super.key,required this.text,required this.subText});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(text, style: TextStyles.font18DarkBlueSemiBold,),
      Spacer(),
      Text(subText, style: TextStyles.font12BlueRegular,),
    ],);
  }
}
