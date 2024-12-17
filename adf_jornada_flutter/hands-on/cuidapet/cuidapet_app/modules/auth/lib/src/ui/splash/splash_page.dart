import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final AuthStore _authStore;
  const SplashPage({super.key, required AuthStore authStore}):_authStore = authStore;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? urlLogo;

  @override
  void initState() {
    super.initState();
    _setLogo();
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLoggerd){
      if (userLoggerd != null && userLoggerd.email.isNotEmpty) {
        
      } else {
        
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: urlLogo == null
            ? const CircularProgressIndicator()
            : Image.network(
                urlLogo!,
                width: 162.csw,
                height: 130.csh,
                fit: BoxFit.contain,
              ),
      ),
    );
  }

  void _setLogo() async {
    urlLogo = await FeaturesServicePresenter.to.externalStorage
        .readUrlMidia('institucional/logo.png');
    setState(() {});
  }
}
