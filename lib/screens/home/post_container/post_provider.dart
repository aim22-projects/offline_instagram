import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mime/mime.dart';
import 'package:offline_instagram/constants/app_router.dart';

class PostProvider extends ChangeNotifier {
  // private final fields
  List<File> _media = [];
  double _height = 80;
  final BuildContext context;
  PostProvider(this.context, String path) {
    _getMedia(path);
  }
  // Directory _directory;
  // getters
  List<File> get media => _media;
  double get height => _height;
  // setters
  set setMedia(value) {
    _media = value;
    _media.sort(((a, b) => a.path.compareTo(b.path)));
    notifyListeners();
  }

  set setHeight(value) {
    _height = value;
    notifyListeners();
  }

  // private methods
  void _getMedia(String path) async {
    // get all media (type images) from provided directory path
    setMedia = Directory(path)
        .listSync()
        .whereType<File>()
        .where((element) =>
            lookupMimeType(element.path)?.startsWith('image/') ?? false)
        .toList();
    // if no media found return
    if (media.isEmpty) return;
    // get dimensions of first media
    var firstMedia = await decodeImageFromList(media[0].readAsBytesSync());
    // ignore: use_build_context_synchronously
    var screenWidth = MediaQuery.of(context).size.width;
    setHeight = firstMedia.height * screenWidth / firstMedia.width;
  }

  void goToPostScreen(String path) => GoRouter.of(context)
      .pushNamed(AppRoutes.post.name!, queryParams: {'path': path});
}
