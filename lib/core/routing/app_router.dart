

import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/log_in_view.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // case Routes.kSplashView:
      //   return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.kLoginView:
        return MaterialPageRoute(builder: (_) => const LogInView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("NO route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}