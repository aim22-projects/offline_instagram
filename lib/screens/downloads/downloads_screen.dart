import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:offline_instagram/screens/downloads/download_task.dart';

import '../../widgets/provider_consumer.dart';
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
            onPressed: () {},
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
      itemBuilder: (context, index) => tasksTile(model, index),
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Widget tasksTile(DownloadsProvider model, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(model.tasks[index].name),
          subtitle: LinearProgressIndicator(
            value: model.tasks[index].downloadedSize /
                model.tasks[index].totalSize,
          ),
          leading: CircleAvatar(
            child: Icon(
              model.tasks[index].status == DownloadStatus.completed
                  ? Icons.download_done_rounded
                  : model.tasks[index].status == DownloadStatus.downloading
                      ? Icons.download_rounded
                      : Icons.close,
            ),
          ),
          trailing: Text(
              '${filesize(model.tasks[index].downloadedSize, 0)}/${filesize(model.tasks[index].totalSize, 0)}'),
        ),
      ],
    );
  }
}
