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
        builder: (context, model, child) => model.linkState == LinkState.found
            ? foundState(model)
            : model.linkState == LinkState.loading
                ? loadingState()
                : initialState(model),
      ),
    );
  }

  Widget initialState(AddDownloadProvider model) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: model.link,
              onEditingComplete: model.search,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                label: Text('Url'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: model.search,
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingState() {
    return const ListTile(
      leading: CircularProgressIndicator(),
      title: Text('Loading link'),
    );
  }

  Widget foundState(AddDownloadProvider model) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              onPressed: model.goBack,
              child: const Text('CANCEL'),
            ),
          )
        ],
      ),
    );
  }
}
