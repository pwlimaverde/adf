import 'package:flutter/material.dart';
import '../../auth/ui/login/widgets/todo_list_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TodoListLogo(),
      ),
    );
  }
}
