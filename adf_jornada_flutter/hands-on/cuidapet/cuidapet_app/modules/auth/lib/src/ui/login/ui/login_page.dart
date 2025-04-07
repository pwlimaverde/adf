import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String? urlLogo = FeaturesServicePresenter.to.urlLogo;
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
    return PageBase(
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
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (_emailEC.text.isNotEmpty) {
                            } else {
                              _emailFocus.requestFocus();
                            }
                          },
                          child: const Text('Esqueceu sua senha?'),
                        ),
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
                          label: 'Entrar',
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
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
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 10.csw,
                      runSpacing: 10.csh,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: [
                        BotaoLoginWith(
                          label: 'Facebook',
                          ontap: () {},
                          whidth: 0.42.sw,
                          color: const Color(0xFF4267b3),
                          icon: CuidapetIcons.facebook,
                        ),
                        BotaoLoginWith(
                          label: 'Google',
                          ontap: () {},
                          whidth: 0.42.sw,
                          color: const Color(0xFFE15031),
                          icon: CuidapetIcons.facebook,
                        ),
                        BotaoLoginWith(
                          label: 'Cadastre-se',
                          ontap: () {
                            Modular.to.pushNamed(Routes.register.caminho);
                          },
                          whidth: 0.42.sw,
                          color: context.primaryColorDark,
                          icon: Icons.mail,
                        ),
                      ],
                    ),
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
