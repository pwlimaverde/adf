import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/ui/utilites/theme_extensions.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../sevices/features/features_service_presenter.dart';
import '../home_controller.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameEC = TextEditingController();
  final _displayNameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(30),
            ),
            currentAccountPicture: Selector<HomeController, String>(
              selector: (context, homeController) {
                return homeController.user?.photoURL ??
                    'https://cdn-icons-png.flaticon.com/256/6073/6073873.png';
              },
              builder: (_, value, __) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(value),
                  radius: 60,
                );
              },
            ),
            accountName: Selector<HomeController, String>(
              selector: (context, homeController) {
                final displayName = homeController.user?.displayName;
                if (displayName == null || displayName.isEmpty) {
                  return 'Nome não informado';
                } else {
                  return displayName;
                }
              },
              builder: (_, value, __) {
                return Text(
                  value,
                  style: context.titleStyle,
                );
              },
            ),
            accountEmail: Selector<HomeController, String>(
              selector: (context, homeController) {
                final email = homeController.user?.email;
                if (email == null || email.isEmpty) {
                  return 'E-mail não informado';
                } else {
                  return email;
                }
              },
              builder: (_, value, __) {
                return Text(
                  value,
                  style: context.subTitleStyle12,
                );
              },
            ),
          ),
          ListTile(
            title: Text('Alterar Nome'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    _displayNameEC.text =
                        context.read<HomeController>().user?.displayName ?? '';
                    return AlertDialog(
                      title: Text('Alterar Nome'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                FieldPadrao(
                                  label: 'Nome',
                                  focusNode: _displayNameFocus,
                                  controller: _displayNameEC,
                                  validator: Validatorless.multiple([
                                    Validatorless.required("Nome obrigatório"),
                                    Validatorless.min(2,
                                        "Nome deve ter no mínimo 2 caracteres"),
                                  ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () async{
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              final name = _displayNameEC.text;
                              await context
                                  .read<HomeController>()
                                  .updateDisplayName(name);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Salvar'),
                        ),
                      ],
                    );
                  });
            },
          ),
          ListTile(
            title: Text('Alterar Imagem'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () async {
              await context.read<FeaturesServicePresenter>().signOutService();
            },
          )
        ],
      ),
    );
  }
}
