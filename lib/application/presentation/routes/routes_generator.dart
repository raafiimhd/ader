import 'package:ader/application/presentation/auth/login.dart';
import 'package:ader/application/presentation/bottom_navigation/bottom_navigation.dart';
import 'package:ader/application/presentation/home/home_screen.dart';
import 'package:ader/application/presentation/routes/routes.dart';
import 'package:ader/application/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route onRouteGenerator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (ctx) => const ScreenSplash());
      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: (ctx) => const BottomNavigationWidget(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (ctx) => Login(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return const Scaffold(
        body: Center(
          child: Text('Something Error'),
        ),
      );
    });
  }
}
