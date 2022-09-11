import 'dart:io';

import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final String path;
  const PostScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          maxScale: 5,
          child: Image.file(File(path)),
        ),
      ),
    );
  }
}
