import 'package:flutter/material.dart';

import '../../widgets/provider_consumer.dart';
import 'download_tile/download_tile.dart';
import 'downloads_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(context) {
    return ProviderConsumer<DownloadsProvider>(
      create: (context) => DownloadsProvider(context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Downloads'),
          ),
          body: tasksList(model),
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            onPressed: model.showAddDownloadDialog,
          ),
        );
      },
    );
  }

  ListView tasksList(DownloadsProvider model) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: model.tasks.length,
      itemBuilder: (context, index) => DownloadTile(task: model.tasks[index]),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
