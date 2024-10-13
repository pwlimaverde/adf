import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../messages.dart';
import 'defaut_chang_notifier.dart';

class DefautListnerNotifier {
  final DefautChangNotifier changeNotifier;

  DefautListnerNotifier(this.changeNotifier);

  void listener({
    required BuildContext context,
    SucessVoidCallback? successCallback,
  }) {
    changeNotifier.addListener(() {
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }
      if (changeNotifier.hasInfo) {
        Messages.of(context).showMessage(
          changeNotifier.info ?? "Erro Interno!",
          MessagesType.info,
        );
      }

      if (changeNotifier.hasError) {
        Messages.of(context).showMessage(
          changeNotifier.error ?? "Erro Interno!",
          MessagesType.error,
        );
      }
      if (changeNotifier.isSuccess) {
        if (successCallback != null) {
          successCallback();
          Messages.of(context).showMessage(
            changeNotifier.success ?? "Erro Interno!",
            MessagesType.success,
          );
        } else {
          Messages.of(context).showMessage(
            changeNotifier.success ?? "Erro Interno!",
            MessagesType.success,
          );
        }
      }
    });
  }
}

typedef SucessVoidCallback = void Function(
  // DefautChangNotifier changeNotifier,
  // DefautListnerNotifier listener,
);
