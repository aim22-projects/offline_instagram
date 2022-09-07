import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'downloads_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider<DownloadsProvider>(
      create: (context) => DownloadsProvider(context),
      child: Consumer<DownloadsProvider>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Downloads'),
            ),
            body: tasksList(model),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: model.openAddDownloadDialog,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          );
        },
      ),
    );
  }

  ListView tasksList(DownloadsProvider model) {
    return ListView.builder(
      itemCount: model.tasks.length,
      itemBuilder: (context, index) => tasksTile(model, index),
    );
  }

  Card tasksTile(DownloadsProvider model, int index) {
    return Card(
      child: ListTile(
        title: Text(model.tasks[index]),
      ),
    );
  }
}
