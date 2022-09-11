import 'package:flutter/material.dart';

import '../../../widgets/provider_consumer.dart';
import 'add_download_provider.dart';

class AddDownloadDialog extends StatelessWidget {
  final String? link;
  const AddDownloadDialog({super.key, this.link});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add download'),
      content: ProviderConsumer<AddDownloadProvider>(
        create: (context) => AddDownloadProvider(context),
        builder: (BuildContext context, model, Widget? child) => Form(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: model.link,
                  onEditingComplete: model.search,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    label: const Text('Post url'),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: model.search,
                      icon: const Icon(Icons.search),
                      tooltip: 'Search',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Post name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('DOWNLOAD'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('CANCEL'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
