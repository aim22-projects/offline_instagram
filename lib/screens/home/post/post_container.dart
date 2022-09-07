import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class PostContainer extends StatelessWidget {
  final Directory directory;
  const PostContainer({super.key, required this.directory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(basename(directory.path)),
          subtitle: Text(directory.path),
        ),
        // PageView.builder(
        //   itemCount: 3,
        //   pageSnapping: true,
        //   itemBuilder: (context, index) => Container(
        //     width: 320,
        //     height: 120,
        //     margin: const EdgeInsets.all(8),
        //     child: Text(index.toString()),
        //   ),
        // ),
        // ListTile(
        //   title: Text(basename(directory.path)),
        // ),
      ],
    );
  }
}
