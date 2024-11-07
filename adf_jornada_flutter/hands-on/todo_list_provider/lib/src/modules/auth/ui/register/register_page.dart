import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/utilites/notifier/defaut_listner_notifier.dart';
import '../../../core/ui/utilites/theme_extensions.dart';
import '../../../core/ui/widgets/elevated_button_padrao.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../core/utils/validators.dart';
import '../login/widgets/todo_list_logo.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    final defautListener = DefautListnerNotifier(context.read<RegisterController>());
    defautListener.listener(context: context, successCallback: (notifier, listenerInstance) {
      listenerInstance.dispose();
    });
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Todo List",
              style: TextStyle(
                fontSize: 12,
                color: context.primaryColor,
              ),
            ),
            Text(
              "Cadastro",
              style: TextStyle(
                fontSize: 18,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            child: FittedBox(
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
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
                      height: 20,
                    ),
                    FieldPadrao(
                      label: 'Confirma Senha',
                      controller: _confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("\Confirma Senha obrigatória"),
                        Validators.compare(
                            _passwordEC, "As senhas precisam ser iguais"),
                      ]),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButtonPadrao(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final email = _emailEC.text;
                            final password = _passwordEC.text;
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
                        label: 'Salvar',
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
