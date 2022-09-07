import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

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
          body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const Card(
              child: ListTile(
                title: Text('one'),
              ),
            ),
          ),
        );
      }),
    );
  }
}
