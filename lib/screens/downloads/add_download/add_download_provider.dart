import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AddDownloadProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // private fields;
  String _link = '';
  // constructor
  AddDownloadProvider(this._context);
  //getters
  get link => _link;

  //setters
  set setLink(value) {
    _link = value;
    notifyListeners();
  }

  // public methods
  void goBack() => GoRouter.of(_context).pop();
}
