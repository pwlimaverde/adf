import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/ui/utilites/icons_padrao.dart';
import '../../core/ui/utilites/theme_extensions.dart';
import '../../sevices/features/features_service_presenter.dart';
import '../../tasks/tasks_module.dart';
import 'home_controller.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

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
    context.read<HomeController>().filtroTasks();
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
                    PopupMenuItem<bool>(
                      child: Text('Mostrar tarefas concluídas'),
                    ),
                  ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToTaskCreate(context),
        child: const Icon(Icons.add),
        backgroundColor: context.primaryColor,
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
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
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

  void _goToTaskCreate(BuildContext context) {
    Navigator.of(context).push(
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
  }
}
