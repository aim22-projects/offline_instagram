import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_download_provider.dart';

class AddDownloadDialog extends StatelessWidget {
  final String? link;
  const AddDownloadDialog({super.key, this.link});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddDownloadProvider>(
      create: (context) => AddDownloadProvider(context),
      child: Consumer<AddDownloadProvider>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add Download'),
            ),
            body: Form(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: model.link,
                      decoration: const InputDecoration(
                        label: Text('Url'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Path'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
