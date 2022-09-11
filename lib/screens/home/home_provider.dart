import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app/permission_provider.dart';
import '../../constants/app_router.dart';
import '../../constants/constants.dart';

class HomeProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  final PermissionProvider _permissionProvider;
  List<Directory> _posts = [];
  // final GoRouter _router;
  // constructor
  HomeProvider(this._context)
      : _permissionProvider = _context.read<PermissionProvider>() {
    scanPosts();
  }
  // getters
  List<Directory> get posts => _posts;
  Future<Directory?> get _directory => Directory(workingDirectory).create();
  // setters
  set setPosts(List<Directory> value) {
    _posts = value;
    notifyListeners();
  }

  // public methods
  Future<void> scanPosts() async {
    // var permissionProvider = _context.read<PermissionProvider>();
    if (await _permissionProvider.isStoragePermissionGranted) {
      setPosts = (await _directory)!
          .listSync(followLinks: false)
          .whereType<Directory>()
          .toList();
    }
  }

  void goToSettings() =>
      GoRouter.of(_context).pushNamed(AppRoutes.settings.name!);
  void goToDownloads() =>
      GoRouter.of(_context).pushNamed(AppRoutes.downloads.name!);
}
