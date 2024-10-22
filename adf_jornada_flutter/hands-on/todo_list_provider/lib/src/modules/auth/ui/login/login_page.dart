import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/utilites/messages.dart';
import '../../../core/ui/utilites/notifier/defaut_listner_notifier.dart';
import '../../../core/ui/widgets/elevated_button_padrao.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../core/ui/widgets/page_base.dart';
import 'login_controller.dart';
import 'widgets/todo_list_logo.dart';

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
  void initState() {
    super.initState();
    final defautListener =
        DefautListnerNotifier(context.read<LoginController>());
    defautListener.listener(
        context: context,
        successCallback: () {
          // Navigator.of(context).pop();
        });
  }

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
                key: _formKey,
                child: Column(
                  children: [
                    FieldPadrao(
                      label: 'Email',
                      focusNode: _emailFocus,
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Email obrigatório"),
                        Validatorless.email("Email inválido"),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FieldPadrao(
                      label: 'Senha',
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha obrigatória"),
                        Validatorless.min(
                            6, "Senha deve ter no mínimo 6 caracteres"),
                      ]),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (_emailEC.text.isNotEmpty) {
                              context
                                  .read<LoginController>()
                                  .forgotPassword(_emailEC.text);
                            } else {
                              _emailFocus.requestFocus();
                              Messages.of(context).showMessage(
                                "Digite um email válido!",
                                MessagesType.warning,
                              );
                            }
                          },
                          child: const Text('Esqueceu sua senha?'),
                        ),
                        ElevatedButtonPadrao(
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              final email = _emailEC.text;
                              final password = _passwordEC.text;
                              context.read<LoginController>().loginWithEmail(
                                    email,
                                    password,
                                  );
                            }
                          },
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
                    onPressed: () {
                      context.read<LoginController>().loginWithGoogle();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem conta?'),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/register'),
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
