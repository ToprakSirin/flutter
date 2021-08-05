import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_lovers/services/storage_base.dart';

class FirebaseStorageService implements StorageBase {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference? _storageReferance;

  @override
  Future<String> uploadFile(
      String userID, String fileType, File? yukleneecekDosya) async {
    _storageReferance = _firebaseStorage.ref().child(userID).child(fileType);
    UploadTask _uploadTask =
        _storageReferance!.putFile(File(yukleneecekDosya!.path));
    String? _url;
    await _uploadTask.then((s) async {
      _url = await s.ref.getDownloadURL();
      return _url;
    });

    return _url!;
  }
}
