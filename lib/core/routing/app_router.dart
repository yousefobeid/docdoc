import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/login/ui/widgets/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    // this arguments to be passed in any screen like this (arguments as ClassName)
    // final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => Placeholder());
    }
  }
}
