import 'package:flutter/material.dart';

class TodoListPageBase extends StatelessWidget {
  final Widget child;
  const TodoListPageBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      }),
    );
  }
}
