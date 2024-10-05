import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/routes.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Text('This is initial page'),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(
                          context,
                          Routes.login.caminho,
                        ),
                    icon: const Icon(Icons.calculate)),
         
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
