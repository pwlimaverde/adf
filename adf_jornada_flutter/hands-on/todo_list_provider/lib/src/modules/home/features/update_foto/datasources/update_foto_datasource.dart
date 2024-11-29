import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../domain/model/update_foto_model.dart';

class UpdateFotoDatasource implements Datasource<UpdateFotoModel> {
  final ImagePicker _picker;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _authInstance;


  UpdateFotoDatasource({
    required ImagePicker picker,
    required FirebaseStorage firebaseStorage,
    required FirebaseAuth authInstance,
  })  : _picker = picker,
        _authInstance = authInstance,
        _firebaseStorage = firebaseStorage;

  @override
  Future<UpdateFotoModel> call(
    NoParams parameters,
  ) async {
    try {

      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        Reference ref =
            _firebaseStorage.ref().child('config-user').child('/photoUser.jpg');

        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': image.path},
        );
        await ref.putFile(File(image.path), metadata);
        final url = await ref.getDownloadURL();
        final user = _authInstance.currentUser;
        await user?.updatePhotoURL(url);
        await user?.reload();

        return UpdateFotoModel();
      } else {
        throw Exception('Nenhuma imagem selecionada');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
