import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'modules/core/utils/module.dart';

final class AppModule implements Module {
  @override
  List<SingleChildWidget> routes = [
    Provider(create: (_)=> Object())
  ];
}
