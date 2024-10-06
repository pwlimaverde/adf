import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../../../core/ui/widgets/elevated_button_padrao.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../core/ui/widgets/page_base.dart';
import 'widgets/todo_list_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const TodoListLogo(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
                child: Column(
              children: [
                FieldPadrao(label: 'Email',),
                const SizedBox(
                  height: 20,
                ),
                FieldPadrao(label: 'Senha', obscureText: true,),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Esqueceu sua senha?'),
                    ),
                    ElevatedButtonPadrao(
                      onPressed: () {},
                      label: 'Login',
                    ),
                  ],
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF0F3F7),
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: Colors.grey.withAlpha(50),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: 'Continue com o Google',
                    padding: const EdgeInsets.all(10),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem conta?'),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed('/register'),
                        child: const Text('Cadastre-se'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
