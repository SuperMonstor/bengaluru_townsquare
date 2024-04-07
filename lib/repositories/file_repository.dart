import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FileRepository {
  Future<String?> uploadFile(
      {File? file, required String fileName, required String folderName});
}

class FirebaseFileRepository implements FileRepository {
  @override
  Future<String?> uploadFile(
      {File? file,
      required String fileName,
      required String folderName}) async {
    if (file == null) {
      return null;
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(folderName)
        .child('/$fileName.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    return ref
        .putData(await file.readAsBytes(), metadata)
        .then((p0) async => await ref.getDownloadURL());
  }
}
