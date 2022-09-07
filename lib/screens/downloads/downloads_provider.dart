import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_router.dart';

class DownloadsProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // private fields
  // ignore: unused_field
  StreamSubscription<String>? _streamSubscription;
  // private fields
  List<String> _tasks = ['Image1', 'Image2'];

  DownloadsProvider(this._context);

  set addTask(String value) {
    _tasks.add(value);
    notifyListeners();
  }

  // public setters
  set setTasks(List<String> value) {
    _tasks = value;
    notifyListeners();
  }

  // public getters
  List<String> get tasks => _tasks;

  void openAddDownloadDialog([String? path]) {
    GoRouter.of(_context).pushNamed(
      AppRoutes.addDownload.name!,
      queryParams: {'link': path},
    );
  }
}
