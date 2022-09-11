import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderConsumer<T extends ChangeNotifier> extends StatelessWidget {
  /// Creates a [ChangeNotifier] using `create` and automatically
  /// disposes it when [ProviderConsumer] is removed from the widget tree.
  ///
  /// `create` must not be `null`.
  final T Function(BuildContext context) create;

  ///Build a widget tree based on the value from a [Provider].

  ///Must not be `null`.
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final Widget? child;

  const ProviderConsumer({
    super.key,
    required this.create,
    required this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: Consumer(
        builder: builder,
        child: child,
      ),
    );
  }
}

// example
// class DemoProvider extends ChangeNotifier {
//   String title = 'Demo Screen n';
// }

// class DemoScreen extends StatelessWidget {
//   const DemoScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ProviderConsumer<DemoProvider>(
//       create: (context) => DemoProvider(),
//       builder: (context, model, child) => Scaffold(
//         appBar: AppBar(
//           title: Text(model.title),
//         ),
//       ),
//     );
//   }
// }
