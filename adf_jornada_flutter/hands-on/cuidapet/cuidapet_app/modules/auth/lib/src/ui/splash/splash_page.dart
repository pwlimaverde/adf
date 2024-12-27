import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final AuthStore _authStore;
  const SplashPage({super.key, required AuthStore authStore}):_authStore = authStore;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final String? urlLogo = FeaturesServicePresenter.to.urlLogo;
 
  @override
  void initState() {
    super.initState();
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLoggerd){
      if (userLoggerd != null && userLoggerd.email.isNotEmpty) {
        Modular.to.navigate(Routes.home.caminho);
      } else {
        Modular.to.navigate(Routes.login.caminho);
        
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._authStore.loadUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: urlLogo == null
            ? const CircularProgressIndicator()
            : LogoCliente(urlLogoCliente: urlLogo!,),
      ),
    );
  }
}
