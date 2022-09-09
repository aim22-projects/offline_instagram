import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_router.dart';
import '../../constants/constants.dart';

class HomeProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  List<Directory> _posts = [];
  // final GoRouter _router;
  // constructor
  HomeProvider(this._context) {
    scanPosts();
  }
  // getters
  List<Directory> get posts => _posts;
  Future<Directory?> get _directory => Directory(appDirectory).create();
  // setters
  set setPosts(List<Directory> value) {
    _posts = value;
    notifyListeners();
  }

  // public methods
  void scanPosts() async {
    setPosts = (await _directory)!
        .listSync(followLinks: false)
        .whereType<Directory>()
        .toList();
  }

  void goToSettings() =>
      GoRouter.of(_context).pushNamed(AppRoutes.settings.name!);
  void goToDownloads() =>
      GoRouter.of(_context).pushNamed(AppRoutes.downloads.name!);
}
