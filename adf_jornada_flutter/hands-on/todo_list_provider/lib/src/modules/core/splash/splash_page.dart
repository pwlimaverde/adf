import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../sevices/features/external_storage/domain/models/registro.dart';
import '../../sevices/features/features_service_presenter.dart';
import '../../sevices/start_services.dart';
import '../ui/widgets/elevated_button_padrao.dart';
import '../utils/firebase_options.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeServices();
    });
  }

  Future<void> _initializeServices() async {
    // await startServices(
    //   options: DefaultFirebaseOptions.currentPlatform,
    //   context: context,
    // );

    final instance = Provider.of<FeaturesServicePresenter>(context, listen: false);
    final collection = await instance.externalStorage
        .readDocument(Registro(colecao: "teste", documento: "testedoc"));
    print("teste splash");
    print(collection);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spalsh'),
      ),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonPadrao(
                      onPressed: () => Navigator.of(context).pushNamed('/home'),
                      label: '/home',
                    ),
                    const SizedBox(width: 40,),
                    ElevatedButtonPadrao(
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                      label: '/login',
                    ),

            ],
          )),
    );
  }
}
