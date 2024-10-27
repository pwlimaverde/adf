import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Selector<HomeController, String>(
              selector: (context, controller) =>
                  controller.user?.displayName ?? 'Usuário',
              builder: (_, value, __) {
                return FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "E ai, $value!",
                    style: context.titleStyle.copyWith(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
