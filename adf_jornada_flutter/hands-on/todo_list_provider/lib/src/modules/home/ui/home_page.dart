import 'package:flutter/material.dart';

import 'widgets/home_drawer.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: HomeDrawer(),
      body: Container(),
    );
  }
}
