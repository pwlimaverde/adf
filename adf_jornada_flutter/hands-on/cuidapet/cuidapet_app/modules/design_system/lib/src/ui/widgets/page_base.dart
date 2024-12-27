import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final Widget child;
  final  PreferredSizeWidget? appBar;

  const PageBase({
    super.key,
    this.appBar,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
