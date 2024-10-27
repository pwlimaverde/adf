import 'package:flutter/material.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import 'tasks.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'TASL\'S DE HOJE',
            style: context.titleStyle,
          ),
          Column(
            children: [
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
              Tasks(),
            ],
          ),
        ],
      ),
    );
  }
}
