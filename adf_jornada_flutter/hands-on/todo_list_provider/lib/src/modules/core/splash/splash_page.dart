import 'package:flutter/material.dart';

import '../ui/widgets/elevated_button_padrao.dart';

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
              ElevatedButtonPadrao(
                      onPressed: () => Navigator.of(context).pushNamed('/home'),
                      label: '/home',
                    ),
                    const SizedBox(width: 40,),
                    ElevatedButtonPadrao(
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                      label: '/login',
                    ),

            ],
          )),
    );
  }
}
