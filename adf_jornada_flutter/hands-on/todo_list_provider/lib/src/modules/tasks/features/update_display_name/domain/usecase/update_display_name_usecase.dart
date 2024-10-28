import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import '../model/update_display_name_model.dart';

final class UpdateDisplayNameUsecase extends UsecaseBase<UpdateDisplayNameModel> {
  FirebaseAuth _authInstance;
  UpdateDisplayNameUsecase(
    FirebaseAuth authInstance,
  ) : _authInstance = authInstance;
  @override
  Future<ReturnSuccessOrError<UpdateDisplayNameModel>> call(
      ParametrosUpdateDisplayName parameters) async {
    try {
      final user = _authInstance.currentUser;
      if (user == null) {
        return ErrorReturn(
          error: UserError(
            message: "Usuário não encontrado!",
          ),
        );
      } else {
        await user.updateDisplayName(parameters.nome);
        await user.reload();
        return SuccessReturn(
          success: UpdateDisplayNameModel(),
        );
      }
    } catch (e, s) {
      print(e);
      print(s);
      return ErrorReturn(
        error: UserError(
          message: "Erro ao atualizar o nome do usuário!",
        ),
      );
    }
  }
}
