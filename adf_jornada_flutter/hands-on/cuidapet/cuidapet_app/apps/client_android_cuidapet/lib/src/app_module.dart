import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Column(
        children: [
          const Center(
            child: Text('This is initial page'),
          ),
          TextButton(
              onPressed: () {
                Asuka.showSnackBar(const SnackBar(
                  content: Text("Hello World"),
                ));

                AsukaSnackbar.success("success").show();
              },
              child: Text('teste'))
        ],
      ),
    );
  }
}
