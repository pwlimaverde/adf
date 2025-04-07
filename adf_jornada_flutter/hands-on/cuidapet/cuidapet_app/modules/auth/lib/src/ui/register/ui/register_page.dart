import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String? urlLogo = FeaturesServicePresenter.to.urlLogo;
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _passwordConfirmEC = TextEditingController();
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
    return PageBase(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastrar Usiário'),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5.csw,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.csw),
            child: urlLogo == null
                ? const CircularProgressIndicator()
                : LogoCliente(
                    urlLogoCliente: urlLogo!,
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.csh,
              vertical: 5.csw,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10.csw,
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
                  FieldPadrao(
                    label: 'Confirma Senha',
                    controller: _passwordConfirmEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha obrigatória"),
                      Validatorless.min(
                          6, "Senha deve ter no mínimo 6 caracteres"),
                    ]),
                    obscureText: true,
                  ),
                  SizedBox(
                    width: 10.csw,
                  ),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButtonPadrao(
                        padding: 0,
                        height: 45.csw,
                        onPressed: () {
                          // final formValid =
                          //     _formKey.currentState?.validate() ?? false;
                          // if (formValid) {
                          //   final email = _emailEC.text;
                          //   final password = _passwordEC.text;

                          // }
                        },
                        label: 'Cadastrar',
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
