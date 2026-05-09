import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/theming/app_colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

class GetStartedButtonWidget extends StatelessWidget {
  const GetStartedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManger.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 52)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      child: Text("Get Started", style: TextStyles.font16WhiteSemiBold),
    );
  }
}
