import 'package:go_router/go_router.dart';

import '../screens/downloads/downloads_screen.dart';
import '../screens/error/error_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/post/post_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  AppRoutes._();
  // home
  static final home = GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomeScreen(),
  );
  static final post = GoRoute(
    name: 'post',
    path: '/post',
    builder: (context, state) =>
        PostScreen(path: state.queryParams['path'] ?? ''),
  );
  // downloads
  static final downloads = GoRoute(
    name: 'downloads',
    path: '/downloads',
    builder: (context, state) => const DownloadsScreen(),
  );
  // settings
  static final settings = GoRoute(
    name: 'settings',
    path: '/settings',
    builder: (context, state) => const SettingsScreen(),
  );
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.home.path,
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    // home
    AppRoutes.home,
    AppRoutes.post,
    // downloads
    AppRoutes.downloads,
    // settings
    AppRoutes.settings,
    // demo
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
