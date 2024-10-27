import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'update_display_name/domain/model/update_display_name_model.dart';
import 'update_foto/domain/model/update_foto_model.dart';

final class FeaturesHomePresenter {
  static FeaturesHomePresenter? _instance;

  final UDNusecase _updateDisplayName;
  final UFusecase _updateFoto;

  FeaturesHomePresenter._({
    required UDNusecase updateDisplayName,
    required UFusecase updateFoto,
  })  : _updateDisplayName = updateDisplayName,
        _updateFoto = updateFoto;

  factory FeaturesHomePresenter({
    required UDNusecase updateDisplayName,
    required UFusecase updateFoto,
  }) {
    _instance ??= FeaturesHomePresenter._(
      updateDisplayName: updateDisplayName,
      updateFoto: updateFoto,
    );
    return _instance!;
  }

  Future<Unit> updateDisplayName(
    String nome,
  ) async {
    final data = await _updateDisplayName(ParametrosUpdateDisplayName(
      nome: nome,
      error: UserError(message: "Erro ao atualizar o usuário!"),
    ));
    switch (data) {
      case SuccessReturn<UpdateDisplayNameModel>():
        return unit;
      case ErrorReturn<UpdateDisplayNameModel>():
        throw data.result;
    }
  }

  Future<Unit> updateFoto() async {
    final data = await _updateFoto(NoParams(
      error: UserError(message: "Erro ao atualizar o usuário!"),
    ));
    switch (data) {
      case SuccessReturn<UpdateFotoModel>():
        return unit;
      case ErrorReturn<UpdateFotoModel>():
        throw data.result;
    }
  }
}
