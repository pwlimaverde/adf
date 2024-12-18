import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FieldPadrao(
                label: 'Login',
                obscureText: true,
                controller: _emailEC,
                focusNode: _emailFocus,
                validator: Validatorless.multiple([
                  Validatorless.required("Senha obrigatória"),
                  Validatorless.min(6, "Senha deve ter no mínimo 6 caracteres"),
                ]),
              ),
            ),
            const Icon(CuidapetIcons.google),
            const Icon(CuidapetIcons.facebook),
            ElevatedButtonPadrao(label: 'Entrar', onPressed: () {  },),
            BotaoLoginWith(
              color: Colors.blue,
              ontap: () {
                print('teste');
              },
              whidth: 200,
              icon: CuidapetIcons.facebook,
              label: 'Facebook',
            ),
            BotaoLoginWith(
              color: Colors.red,
              ontap: () {
                print('teste');
              },
              whidth: 200,
              icon: CuidapetIcons.google,
              label: 'Google',
            ),
          ],
        ),
      ),
    );
  }
}
