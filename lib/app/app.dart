import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/themes/app_theme.dart';
import '../routes/pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        useInheritedMediaQuery: true,
        initialRoute: Routes.home,
        defaultTransition: Transition.fade,
        themeMode: ThemeMode.system,
        navigatorKey: Get.key,
        getPages: AppPages.pages,
        theme: AppThemeData.getThemeData(),
      )),
    );
  }
}