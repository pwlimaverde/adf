import 'package:return_success_or_error/return_success_or_error.dart';

import '../utils/erros.dart';
import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'update_display_name/domain/model/update_display_name_model.dart';


final class FeaturesHomePresenter {
  static FeaturesHomePresenter? _instance;

  final UDNsecase _updateDisplayName;


  FeaturesHomePresenter._({
    required UDNsecase updateDisplayName,
  })  : _updateDisplayName = updateDisplayName;

  factory FeaturesHomePresenter({
    required UDNsecase updateDisplayName,
  }) {
    _instance ??= FeaturesHomePresenter._(
      updateDisplayName: updateDisplayName,
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
}
