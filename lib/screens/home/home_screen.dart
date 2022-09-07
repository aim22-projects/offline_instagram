import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';
import 'post/post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(context),
      child: Consumer<HomeProvider>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                tooltip: 'Refresh',
                onPressed: model.scanPosts,
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                tooltip: 'Settings',
                onPressed: model.goToSettings,
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                tooltip: 'Downloads',
                onPressed: model.goToDownloads,
                icon: const Icon(Icons.download),
              ),
            ],
          ),
          body: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: model.posts.length,
            itemBuilder: (context, index) =>
                PostContainer(directory: model.posts[index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      }),
    );
  }
}
