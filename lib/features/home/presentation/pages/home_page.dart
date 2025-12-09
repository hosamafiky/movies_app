import 'package:flutter/material.dart';

import '../../../theme/presentation/widgets/theme_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CinemaHub'), actions: [ThemeIconButton()]),
      body: Center(child: Text('Home Page')),
    );
  }
}
