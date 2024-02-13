import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spalsh'),
      ),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                      child: const Text('/home'),
                      onPressed: () => Navigator.of(context).pushNamed('/home'),
                    ),
                    const SizedBox(width: 40,),
                    ElevatedButton(
                      child: const Text('/login'),
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                    ),

            ],
          )),
    );
  }
}
