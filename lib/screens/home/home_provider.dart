import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_router.dart';
import '../../constants/constants.dart';

class HomeProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  Directory? directory;
  List<Directory> _posts = [];
  // final GoRouter _router;
  // constructor
  HomeProvider(this._context) {
    openDirectory();
  }
  // getters
  List<Directory> get posts => _posts;
  // setters
  set setPosts(List<Directory> value) {
    _posts = value;
    notifyListeners();
  }

  // private methods
  void openDirectory() async {
    directory = await Directory(appDirectory).create();
    scanPosts();
  }

  scanPosts() {
    setPosts =
        directory!.listSync(followLinks: false).whereType<Directory>().toList();
  }

  // public methods
  goToSettings() => GoRouter.of(_context).pushNamed(AppRoutes.settings.name!);
  goToDownloads() => GoRouter.of(_context).pushNamed(AppRoutes.downloads.name!);
}
