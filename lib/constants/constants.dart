import 'dart:io';

const String appName = 'Offline Instagram';

const String appDirectory = '/storage/emulated/0/OfflineInstagram';

String get workingDirectory => Platform.isAndroid
    ? appDirectory
    : '${Directory.current.path}/OfflineInstagram';
