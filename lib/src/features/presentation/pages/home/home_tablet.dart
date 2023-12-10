import 'package:flutter/material.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'HomeTablet',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    )
    );
  }
}
