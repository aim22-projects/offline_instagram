import 'package:go_router/go_router.dart';

import '../screens/downloads/add_download/add_download_dialog.dart';
import '../screens/downloads/downloads_screen.dart';
import '../screens/error/error_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  AppRoutes._();
  // home
  static final home = GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomeScreen(),
    routes: [],
  );
  // downloads
  static final downloads = GoRoute(
    name: 'downloads',
    path: '/downloads',
    builder: (context, state) => const DownloadsScreen(),
  );
  static final addDownload = GoRoute(
    name: 'add_downloads',
    path: '/downloads/add',
    builder: (context, state) => AddDownloadDialog(
      link: state.queryParams['link'],
    ),
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
    // downloads
    AppRoutes.downloads,
    AppRoutes.addDownload,
    // settings
    AppRoutes.settings,
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
