import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Yousef!', style: TextStyles.font22DarkBlueBold),
            Text('How Are you Today', style: TextStyles.font14GreyRegular),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManger.moreLighterGray,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
