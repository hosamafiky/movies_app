import 'package:flutter/material.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular TV Shows')),
      body: const Center(child: Text('TV Shows List Placeholder')),
    );
  }
}
