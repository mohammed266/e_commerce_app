import '../../features/home/data/models/products_model.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/main_home_view.dart';
import '../../features/home/presentation/views/product_details_view.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // case Routes.kSplashView:
      //   return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.kLoginView:
        return MaterialPageRoute(builder: (_) => const LogInView());
      case Routes.kSingUpView:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.kMainHomeView:
        return MaterialPageRoute(builder: (_) => const MainHomeView());
      case Routes.kDetailsView:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(
            productsModel: arguments as ProductsModel,
          ),
        );

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
