import 'package:dependencies/dependencies.dart';

import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
  }
}
