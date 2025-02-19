import 'package:dicoding_flutter_fundamental/features/bookmark/bookmark_screen.dart';
import 'package:dicoding_flutter_fundamental/features/dashboard/dashboard_screen.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/restaurant_details_screen.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_list/restaurant_list_screen.dart';
import 'package:dicoding_flutter_fundamental/features/settings/settings_screen.dart';
import 'package:dicoding_flutter_fundamental/features/splash/splash_screen.dart';
import 'package:dicoding_flutter_fundamental/navigation/named_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _shellNavigator = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: NamedRouter.splash,
    routes: <RouteBase>[
      GoRoute(
        path: NamedRouter.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => DashboardScreen(child: child),
        routes: [
          GoRoute(
            path: NamedRouter.restaurantList,
            builder: (context, state) => const RestaurantListScreen(),
          ),
          GoRoute(
            path: NamedRouter.bookmarkPage,
            builder: (context, state) => const BookmarkScreen(),
          ),
        ],
      ),
      GoRoute(
        path: NamedRouter.restaurantDetails,
        builder: (context, state) {
          return RestaurantDetailsScreen(
            id: state.pathParameters['id'] ?? "",
          );
        },
      ),
      GoRoute(
        path: NamedRouter.settingsPage,
        builder: (context, state) => const SettingsScreen(),
      )
    ],
  );
}
