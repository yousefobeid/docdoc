import 'package:docdoc/core/helpers/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'do not have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'Sign Up ',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
