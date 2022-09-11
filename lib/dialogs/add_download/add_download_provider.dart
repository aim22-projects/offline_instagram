import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_instagram/dialogs/add_download/add_download_dialog.dart';

class AddDownloadProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // private fields;
  String _link = '';
  bool _validLink = false;
  // constructor
  AddDownloadProvider(this._context);
  //getters
  get link => _link;
  get validLink => _validLink;

  //setters
  set setLink(String value) {
    _link = value;
    notifyListeners();
  }

  set setValidLink(bool value) {
    _validLink = value;
    notifyListeners();
  }

  // public methods
  void search() {
    // ScaffoldMessenger.of(_context).showSnackBar(SnackBar(content: Text('')));
  }
  void showAddDownloadDialog() {
    showDialog(
      context: _context,
      builder: (context) => const AddDownloadDialog(),
    );
  }

  void goBack() => GoRouter.of(_context).pop();
}
