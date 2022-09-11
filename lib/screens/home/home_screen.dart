import 'package:flutter/material.dart';

import '../../widgets/provider_consumer.dart';
import 'home_provider.dart';
import 'post_container/post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return ProviderConsumer<HomeProvider>(
      create: (context) => HomeProvider(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
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
        body: RefreshIndicator(
          onRefresh: () => model.scanPosts(),
          child: ListView.separated(
            // shrinkWrap: true, don't use shrinkwrap as inner page view will give error
            itemCount: model.posts.length,
            itemBuilder: (context, index) =>
                PostContainer(path: model.posts[index].path),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
