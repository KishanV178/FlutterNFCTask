import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/const/app_routes.dart';
import 'package:flutter_nfc_task/ui/card_info_collect_screen.dart';
import 'package:flutter_nfc_task/ui/confirmation_screen.dart';

class AppRouteManager {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static PageRoute onGenerateRoute(RouteSettings settings) {
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmationScreen(),
          settings: const RouteSettings(
            name: AppRoutes.homeScreen,
          ),
        );
      case AppRoutes.cardInfoCollectScreen:
        return MaterialPageRoute(
          builder: (context) => const CardInfoCollectScreen(),
          settings: const RouteSettings(
            name: AppRoutes.cardInfoCollectScreen,
          ),
        );
      case AppRoutes.confirmationScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmationScreen(),
          settings: const RouteSettings(
            name: AppRoutes.confirmationScreen,
          ),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('404!!'),
      ),
    );
  }

  static Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
    BuildContext? context,
  }) {
    if (context != null) {
      return Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate, arguments: arguments);
    }
    return (navigatorKey.currentState)
        ?.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  static void pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop<T>(result);
  }

  static void popUntil<T extends Object?>(RoutePredicate predicate) {
    return navigatorKey.currentState?.popUntil(predicate);
  }
}
