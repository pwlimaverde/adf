import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../messages.dart';
import 'defaut_chang_notifier.dart';

class DefautListnerNotifier {
  final DefautChangNotifier changeNotifier;

  DefautListnerNotifier(this.changeNotifier);

  void listener({
    required BuildContext context,
    required SucessVoidCallback successCallback,
    ErrorVoidCallback? errorCallback,
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
        if (errorCallback != null) {
          errorCallback(
            changeNotifier,
            this,
          );
        }
        Messages.of(context).showMessage(
          changeNotifier.error ?? "Erro Interno!",
          MessagesType.error,
        );
      }
      if (changeNotifier.isSuccess) {
        successCallback(
          changeNotifier,
          this,
        );
        Messages.of(context).showMessage(
          changeNotifier.success ?? "Erro Interno!",
          MessagesType.success,
        );
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SucessVoidCallback = void Function(
  DefautChangNotifier changeNotifier,
  DefautListnerNotifier listener,
);

typedef ErrorVoidCallback = void Function(
  DefautChangNotifier changeNotifier,
  DefautListnerNotifier listener,
);
