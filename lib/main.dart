import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_task/ui/dashboard_main.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC demo',
      theme: ThemeData(
          bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                ),
              ),
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            color: AppColor.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.transparent,
              statusBarBrightness: Brightness.dark,
            ),
            elevation: 0,
          )),
      navigatorKey: AppRouteManager.navigatorKey,
      onGenerateRoute: AppRouteManager.onGenerateRoute,
      home: const DashboardMain(),
    );
  }
}
