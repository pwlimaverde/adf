import 'package:firebase_auth/firebase_auth.dart';

import '../../core/ui/utilites/notifier/defaut_chang_notifier.dart';
import '../../sevices/features/features_service_presenter.dart';
import '../features/features_home_presenter.dart';
import '../utils/erros.dart';

final class HomeController extends DefautChangNotifier {
  final FeaturesHomePresenter _featuresHomePresenter;
  final FeaturesServicePresenter _featuresServicePresenter;

  HomeController({
    required FeaturesHomePresenter featuresHomePresenter,
    required FeaturesServicePresenter featuresServicePresenter,
  }) : _featuresHomePresenter = featuresHomePresenter, 
        _featuresServicePresenter = featuresServicePresenter;

  User? get user => _featuresServicePresenter.user;

  Future<void> updateDisplayName(
    String nome,
  ) async {
    try {
      showLoading();
      await _featuresHomePresenter.updateDisplayName(nome);
      await _featuresServicePresenter.currentUserService();

    } on UserError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }
  Future<void> updateFoto() async {
    try {
      showLoading();
      await _featuresHomePresenter.updateFoto();
      await _featuresServicePresenter.currentUserService();

    } on UserError catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
    }
  }
}
