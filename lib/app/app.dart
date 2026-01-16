import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:crafty_bay/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      initialRoute: RouteNames.splashScreen,
      getPages: RoutePages.routes,
      initialBinding: ControllerBinder(),
    );
  }
}
