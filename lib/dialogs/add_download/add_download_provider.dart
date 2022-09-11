import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum LinkState {
  initial, // initial state
  loading, // loading started state
  found, // media found state
  notFound, // media not found state
}

class AddDownloadProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;
  // private fields;
  String _link = '';
  bool _validLink = false;
  LinkState _linkState = LinkState.initial;
  // constructor
  AddDownloadProvider(this._context);
  //getters
  get link => _link;
  get validLink => _validLink;
  get linkState => _linkState;

  //setters
  set setLink(String value) {
    _link = value;
    notifyListeners();
  }

  set setValidLink(bool value) {
    _validLink = value;
    notifyListeners();
  }

  set setLinkState(LinkState value) {
    _linkState = value;
    notifyListeners();
  }

  // public methods
  void search() {
    setLinkState = LinkState.loading;
    Future.delayed(
      const Duration(seconds: 4),
      () => setLinkState = LinkState.found,
    );
  }

  void startDownload() {
    Navigator.of(_context).pop();
  }

  void goBack() => GoRouter.of(_context).pop();
}
