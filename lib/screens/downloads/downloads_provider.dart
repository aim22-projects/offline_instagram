import 'dart:async';

import 'package:flutter/material.dart';

import '../../dialogs/add_download/add_download_dialog.dart';
import 'download_task.dart';

class DownloadsProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // private fields
  // ignore: unused_field
  StreamSubscription<String>? _streamSubscription;
  // private fields
  List<DownloadTask> _tasks = [
    DownloadTask(
      name: 'Post 1',
      link: '',
      path: '',
      totalSize: 50,
      downloadedSize: 10,
      status: DownloadStatus.downloading,
    ),
    DownloadTask(
      name: 'Post 2',
      link: '',
      path: '',
      totalSize: 50,
      downloadedSize: 50,
      status: DownloadStatus.completed,
    ),
    DownloadTask(
      name: 'Post 3',
      link: '',
      path: '',
      totalSize: 50,
      downloadedSize: 10,
      status: DownloadStatus.canceled,
    ),
  ];

  DownloadsProvider(this._context);

  set addTask(DownloadTask value) {
    _tasks.add(value);
    notifyListeners();
  }

  // public setters
  set setTasks(List<DownloadTask> value) {
    _tasks = value;
    notifyListeners();
  }

  // public getters
  List<DownloadTask> get tasks => _tasks;

  void showAddDownloadDialog() {
    showDialog(
      context: _context,
      builder: (context) => const AddDownloadDialog(),
    );
  }
}
