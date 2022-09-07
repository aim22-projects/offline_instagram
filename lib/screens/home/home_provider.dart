import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_router.dart';

class HomeProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // final GoRouter _router;
  // constructor
  HomeProvider(this._context);

  //public methods
  goToSettings() => GoRouter.of(_context).pushNamed(AppRoutes.settings.name!);
  goToDownloads() => GoRouter.of(_context).pushNamed(AppRoutes.downloads.name!);
}
