import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SettingsProvider extends ChangeNotifier {
  // private final fields
  final BuildContext _context;

  SettingsProvider(this._context);
  // public methods
  goback() => GoRouter.of(_context).pop();
}
