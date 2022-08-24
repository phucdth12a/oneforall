import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/routes/routes.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: EasyLoading.init(),
      title: 'All Job',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: showHome ? Routes.home : Routes.onboarding,
      getPages: Routes.getPages,
    );
  }
}
