import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionProvider extends ChangeNotifier {
  Future<bool> get isStoragePermissionGranted async {
    PermissionStatus result;

    if (Platform.isAndroid) {
      result = await Permission.storage.request();
    } else if (Platform.isIOS) {
      result = await Permission.photos.request();
    } else {
      result = PermissionStatus.granted;
    }

    return result.isGranted;
  }
}
