import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Page', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Center(
        child: Text('Link not found or wrong route!', style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
