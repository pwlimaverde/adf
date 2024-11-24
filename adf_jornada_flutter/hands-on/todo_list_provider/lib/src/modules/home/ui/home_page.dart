import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../core/ui/utilites/icons_padrao.dart';
import '../../core/ui/utilites/notifier/defaut_listner_notifier.dart';
import '../../core/ui/utilites/theme_extensions.dart';
import '../../sevices/features/features_service_presenter.dart';
import '../../sevices/features/local_storage/datasource/sqlite/config/sqlite_adm_connection.dart';
import '../../tasks/tasks_module.dart';
import '../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import 'home_controller.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_data_filter.dart';

final class HomePage extends StatefulWidget {
  final HomeController _controller;
  final FeaturesServicePresenter _featuresServicePresenter;
  const HomePage({
    super.key,
    required HomeController controller,
    required FeaturesServicePresenter featuresServicePresenter,
  })  : _controller = controller,
        _featuresServicePresenter = featuresServicePresenter;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final uid = widget._controller.user?.uid;
    Logger().t('uid HomePage: $uid');
    if (uid != null) {
      final sqliteAdmConnection = SqliteAdmConnection();

      WidgetsBinding.instance.addObserver(sqliteAdmConnection);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget._controller.loadTotalTasks();
        widget._controller.alterarFiltroAtual(FiltroTasksEnum.hoje, true);
      });
    }
    DefautListnerNotifier(widget._controller).listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
        });
  }

  @override
  void dispose() {
    super.dispose();
    final uid = widget._controller.user?.uid;
    if (uid != null) {
      final sqliteAdmConnection = SqliteAdmConnection();

      WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          PopupMenuButton(
              icon: const Icon(IconsPadrao.filter),
              itemBuilder: (_) => [
                    const PopupMenuItem<bool>(
                      child: Text('Mostrar tarefas concluídas'),
                    ),
                  ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _goToTaskCreate(context),
        backgroundColor: context.primaryColor,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[50],
      drawer: HomeDrawer(
        controller: widget._controller,
        featuresServicePresenter: widget._featuresServicePresenter,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeDataFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _goToTaskCreate(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            TasksModule().getPage(context: context, routeName: '/task/create'),
      ),
    );
    await widget._controller.refreshPage();
  }
}
