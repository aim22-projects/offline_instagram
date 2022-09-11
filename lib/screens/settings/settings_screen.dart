import 'package:flutter/material.dart';

import '../../widgets/provider_consumer.dart';
import 'settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(context) {
    return ProviderConsumer<SettingsProvider>(
      create: (context) => SettingsProvider(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
      ),
    );
  }
}
