import 'dart:io';

import 'package:flutter_lovers/model/user.dart';

abstract class StorageBase {
  Future<String > uploadFile(String userID, String fileType,
  File yuklenecekDosya);
}
