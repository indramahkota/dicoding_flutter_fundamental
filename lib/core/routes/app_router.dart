import 'package:dicoding_flutter_fundamental/core/routes/named_router.dart';
import 'package:dicoding_flutter_fundamental/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NamedRouter.splash,
    routes: <RouteBase>[
      GoRoute(
        path: NamedRouter.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NamedRouter.dashboard,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NamedRouter.restaurantDetails,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
