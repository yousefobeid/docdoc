import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/helpers/shared_pref.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await setUpGetIt();
  //To fix Texts being hidden bug in flutter_screenUtil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkUserIfLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkUserIfLoggedIn() async {
  String? token;
  token = await SharedPrefHelper.getSecuredString(SharedPrefKey.userToken);
  if (!token.isNullOrEmpty()) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
