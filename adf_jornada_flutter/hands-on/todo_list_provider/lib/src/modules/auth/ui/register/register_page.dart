import 'package:flutter/material.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../../core/ui/widgets/elevated_button_padrao.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../login/widgets/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  child: Column(
                children: [
                  FieldPadrao(label: 'Email',),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldPadrao(label: 'Senha', obscureText: true,),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldPadrao(label: 'Confirma Senha', obscureText: true,),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: 
                      ElevatedButtonPadrao(
                        onPressed: () {},
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
