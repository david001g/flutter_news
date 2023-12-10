import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'HomeMobile',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    )
    );
  }
}
