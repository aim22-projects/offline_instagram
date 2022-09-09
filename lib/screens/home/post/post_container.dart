import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'post_provider.dart';

class PostContainer extends StatelessWidget {
  final String path;
  const PostContainer({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostProvider>(
      create: (context) => PostProvider(context, path),
      child: Consumer<PostProvider>(
        builder: (context, model, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(basename(path)),
              ),
              SizedBox(
                height: model.height,
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    keepPage: false,
                    viewportFraction: 1,
                  ),
                  physics: const ClampingScrollPhysics(),
                  scrollBehavior: const MaterialScrollBehavior(),
                  itemCount: model.media.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => model.goToPostScreen(model.media[index].path),
                    child: Image.file(
                      model.media[index],
                      scale: 1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
